#!/usr/bin/env bash
IFS=$'\n\t'

# Configuration: adjust if needed
TAR_BIN="$(command -v tar)"
STAT_BIN="/tmp/tar-stats"   # the "other" tar you want to compare
COPY_SRC="./tar-stats"      # copy this to /tmp/ as requested
FAKETIME_CMD="$(command -v faketime || true)"

if [[ ! -x "${TAR_BIN:-}" ]]; then
  echo "Error: system tar not found or not executable." >&2
  exit 2
fi
if [[ ! -x "${COPY_SRC}" ]]; then
  echo "Error: ${COPY_SRC} not found or not executable. Place your tar-stats binary there." >&2
  exit 2
fi
# Copy tar-stats to /tmp/
cp -f "$COPY_SRC" "$STAT_BIN"
chmod +x "$STAT_BIN"

if [[ ! -x "$STAT_BIN" ]]; then
  echo "Error: failed to copy ${COPY_SRC} to ${STAT_BIN}" >&2
  exit 2
fi

if [[ -z "$FAKETIME_CMD" ]]; then
  echo "Warning: faketime not found. Tests that rely on faketime mtimes will still attempt to run but won't set file mtimes." >&2
  # continue, faketime just won't be used
fi

# Temp workspace
WORKDIR="$(mktemp -d /tmp/tar-create-tests.XXXXXX)"
trap 'rm -rf "$WORKDIR"' EXIT

PASS=0
FAIL=0

# Helpers
die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "==> $*"; }

# Normalize tar listing lines: remove leading ./ if present and ignore empty lines
list_normalize() {
  sed 's#^\./##' | sed '/^$/d' | sort
}

# Run one test case
# Args:
#   $1 = test name
#   $2 = function that sets up files under $TEST_DIR (called with argument $TEST_DIR)
#   $3... = additional tar args to test (applied to both tar binaries)
run_test() {
  local name="$1"; shift
  local setup_func="$1"; shift
  local tar_args=( "$@" )

  info "TEST: $name"
  local testdir="$WORKDIR/${name// /_}.src"
  mkdir -p "$testdir"
  # Call setup function to populate testdir
  "$setup_func" "$testdir"

  local arch1="$WORKDIR/${name// /_}.sys.tar"
  local arch2="$WORKDIR/${name// /_}.stat.tar"
  local list1="$WORKDIR/${name// /_}.sys.list"
  local list2="$WORKDIR/${name// /_}.stat.list"
  local ex1="$WORKDIR/${name// /_}.sys.ex"
  local ex2="$WORKDIR/${name// /_}.stat.ex"
  mkdir -p "$ex1" "$ex2"

  # Create archives using both tar binaries. Use -C to avoid './' ambiguity.
  # The tar_args are appended; ensure -cf is used in front.
  ( cd "$testdir" && "$TAR_BIN" -cf "$arch1" "${tar_args[@]}" . )
  ( cd "$testdir" && "$STAT_BIN" -cf "$arch2" "${tar_args[@]}" . )

  # List members (use system tar to inspect both archives); normalize
  "$TAR_BIN" -tf "$arch1" | list_normalize > "$list1"
  "$TAR_BIN" -tf "$arch2" | list_normalize > "$list2"

  local ok=true
  if ! diff -u "$list1" "$list2" >/dev/null 2>&1; then
    ok=false
    echo "FAIL: member list differs"
    echo "=== ${name} : system tar list ==="
    sed -n '1,200p' "$list1"
    echo "=== ${name} : /tmp/tar-stats list ==="
    sed -n '1,200p' "$list2"
  fi

  # Extract and compare files, mtimes and modes
  ( cd "$ex1" && "$TAR_BIN" -xf "$arch1" )
  ( cd "$ex2" && "$TAR_BIN" -xf "$arch2" )

  # Build file lists of regular files and symlinks found (relative paths, normalized)
  local files1 files2 symlinks1 symlinks2
  files1=$(cd "$ex1" && find . -type f -print | sed 's#^\./##' | sort)
  files2=$(cd "$ex2" && find . -type f -print | sed 's#^\./##' | sort)
  symlinks1=$(cd "$ex1" && find . -type l -print | sed 's#^\./##' | sort)
  symlinks2=$(cd "$ex2" && find . -type l -print | sed 's#^\./##' | sort)

  # Compare file sets
  if ! diff -u <(printf "%s\n" $files1) <(printf "%s\n" $files2) >/dev/null 2>&1; then
    ok=false
    echo "FAIL: regular file sets differ"
    echo "--- files in sys"
    printf "%s\n" $files1
    echo "--- files in stat"
    printf "%s\n" $files2
  fi

  # Compare symlink sets
  if ! diff -u <(printf "%s\n" $symlinks1) <(printf "%s\n" $symlinks2) >/dev/null 2>&1; then
    ok=false
    echo "FAIL: symlink sets differ"
    echo "--- symlinks in sys"
    printf "%s\n" $symlinks1
    echo "--- symlinks in stat"
    printf "%s\n" $symlinks2
  fi

  # For each regular file, compare sha256, mode, mtime
  while IFS= read -r f; do
    [[ -z "$f" ]] && continue
    local f1="$ex1/$f"
    local f2="$ex2/$f"
    # Sha256
    local s1 s2
    s1=$(sha256sum "$f1" | awk '{print $1}')
    s2=$(sha256sum "$f2" | awk '{print $1}')
    if [[ "$s1" != "$s2" ]]; then
      ok=false
      echo "FAIL: content differs for file $f"
      echo "  sys:  $s1"
      echo "  stat: $s2"
    fi
    # Mode (octal)
    local m1 m2
    m1=$(stat -c %a "$f1")
    m2=$(stat -c %a "$f2")
    if [[ "$m1" != "$m2" ]]; then
      ok=false
      echo "FAIL: mode differs for $f (sys:$m1 stat:$m2)"
    fi
    # Mtime (epoch)
    local t1 t2
    t1=$(stat -c %Y "$f1")
    t2=$(stat -c %Y "$f2")
    if [[ "$t1" != "$t2" ]]; then
      ok=false
      echo "FAIL: mtime differs for $f (sys:$t1 stat:$t2)"
    fi
  done < <(printf "%s\n" $files1)

  # Symlink targets comparison
  while IFS= read -r s; do
    [[ -z "$s" ]] && continue
    local s1="$ex1/$s"
    local s2="$ex2/$s"
    local t1 t2
    t1=$(readlink "$s1" || true)
    t2=$(readlink "$s2" || true)
    if [[ "$t1" != "$t2" ]]; then
      ok=false
      echo "FAIL: symlink target differs for $s (sys:$t1 stat:$t2)"
    fi
  done < <(printf "%s\n" $symlinks1)

  # Hardlink check: detect pairs in original testdir with same inode and verify extraction preserved hardlink
  # Original hardlink sets: find -same-file is tricky; instead in the setup functions we create known link pairs with names "hl_src" and "hl_dst"
  if [[ -f "$testdir/hl_src" ]] || [[ -f "$testdir/hl_dst" ]]; then
    # If present, test the extraction for hardlink preservation
    if [[ -f "$ex1/hl_src" && -f "$ex1/hl_dst" ]]; then
      local i1a i1b i2a i2b
      i1a=$(stat -c %i "$ex1/hl_src")
      i1b=$(stat -c %i "$ex1/hl_dst")
      i2a=$(stat -c %i "$ex2/hl_src")
      i2b=$(stat -c %i "$ex2/hl_dst")
      if [[ "$i1a" != "$i1b" ]]; then
        ok=false
        echo "FAIL: system tar did not preserve hardlink between hl_src and hl_dst"
      fi
      if [[ "$i2a" != "$i2b" ]]; then
        ok=false
        echo "FAIL: /tmp/tar-stats did not preserve hardlink between hl_src and hl_dst"
      fi
    else
      ok=false
      echo "FAIL: expected hardlink files not present after extraction"
    fi
  fi

  if $ok; then
    echo "PASS: $name"
    PASS=$((PASS+1))
  else
    echo "=== FAILED: $name ==="
    FAIL=$((FAIL+1))
  fi

  echo ""
}

# Setup functions for different tests
# Each receives the testdir as $1 and should create the needed files/dirs relative to $1.
# They should avoid root-only operations.
touch_with_time() {
  local ts="$1"; shift
  local path="$1"; shift
  if [[ -n "$FAKETIME_CMD" ]]; then
    faketime "$ts" sh -c "cat > \"$path\" <<'EOF'
$2
EOF"
  else
    # fallback: just write file (mtime will be now)
    cat > "$path" <<'EOF'
$2
EOF
  fi
}
# Simpler helper to write contents and set mtime via faketime (if available)
write_with_mtime() {
  local testdir="$1"; shift
  local rel="$1"; shift
  local ts="$1"; shift
  local content="$1"; shift
  mkdir -p "$(dirname "$testdir/$rel")"
  if [[ -n "$FAKETIME_CMD" ]]; then
    faketime "$ts" sh -c "printf '%s' \"\$1\" > \"$testdir/$rel\"" -- "$content"
  else
    printf '%s' "$content" > "$testdir/$rel"
  fi
}

setup_basic_files() {
  local d="$1"
  mkdir -p "$d/dirA"
  write_with_mtime "$d" "file_a.txt" "2020-01-02 03:04:05" "hello world"
  write_with_mtime "$d" "dirA/file_b.txt" "2020-02-03 04:05:06" "inside dir"
  mkdir -p "$d/emptydir"
  : > "$d/emptyfile"
  chmod 0644 "$d/emptyfile"
  chmod 0755 "$d/dirA"
}

setup_symlinks() {
  local d="$1"
  mkdir -p "$d"
  echo "data" > "$d/orig"
  ln -s "orig" "$d/link_to_orig"
  ln -s "../orig" "$d/dirlink"
  mkdir -p "$d/subdir"
  ln -s "../orig" "$d/subdir/rel"
}

setup_hardlinks() {
  local d="$1"
  mkdir -p "$d"
  echo "hardlinkcontent" > "$d/hl_src"
  ln "$d/hl_src" "$d/hl_dst"
}

setup_space_and_unicode() {
  local d="$1"
  mkdir -p "$d"
  write_with_mtime "$d" "file with spaces.txt" "2018-05-06 07:08:09" "spaced"
  write_with_mtime "$d" "unicodé-☃.txt" "2018-05-06 07:08:09" "unicode"
  mkdir -p "$d/dir with space"
  echo "x" > "$d/dir with space/inner"
}

setup_longnames() {
  local d="$1"
  mkdir -p "$d"
  local longname="$(printf 'a%.0s' {1..200})"
  echo "long" > "$d/$longname"
  # also a deep nested path
  mkdir -p "$d/$(printf 'p%.0s/' {1..30})"
  echo "deep" > "$d/$(printf 'p%.0s/' {1..30})deepfile"
}

setup_sparse() {
  local d="$1"
  mkdir -p "$d"
  # create sparse file: create file with a hole by seeking
  # Using dd with seek
  dd if=/dev/zero of="$d/sparse" bs=1 count=0 seek=$((10*1024*1024)) 2>/dev/null || truncate -s 10M "$d/sparse"
  # add a small footer to ensure content at end
  echo "end" >> "$d/sparse"
}

setup_modes_and_mtimes() {
  local d="$1"
  mkdir -p "$d"
  # Create files with different modes and mtimes. Use faketime to set mtimes.
  if [[ -n "$FAKETIME_CMD" ]]; then
    faketime "2001-01-01 00:00:00" sh -c 'printf "one" > "$1"' -- "$d/mode1"
    faketime "2002-02-02 02:02:02" sh -c 'printf "two" > "$1"' -- "$d/mode2"
  else
    printf "one" > "$d/mode1"
    printf "two" > "$d/mode2"
  fi
  chmod 0640 "$d/mode1"
  chmod 0755 "$d/mode2"
}

# Now register tests
run_test "basic files and dirs" setup_basic_files
run_test "symlinks preservation" setup_symlinks
run_test "hardlinks preservation" setup_hardlinks
run_test "names with spaces and unicode" setup_space_and_unicode
run_test "long filenames and deep paths" setup_longnames
run_test "sparse file handling" setup_sparse
run_test "modes and mtimes" setup_modes_and_mtimes

# Summary
echo "SUMMARY: PASS=$PASS FAIL=$FAIL"
if [[ $FAIL -ne 0 ]]; then
  exit 1
fi
exit 0