#!/usr/bin/env bash
#########################################################################
# tar-stats-extract: A 'tar' Wrapper for Archive Extraction             #
#                                                                       #
# Adds progress bars during extraction using 'pv'. Supports all common  #
# formats: .tar.gz, .tar.bz2, .tar.xz, .tar.zst, .tar.lzma.             #
#                                                                       #
# Based on tar-stats by Theodore R. Smith                              #
# https://github.com/hopeseekr/BashScripts/                             #
#########################################################################

set -o pipefail

# --- Help/Usage Function ---
show_help() {
  cat << EOF
Usage: $(basename "$0") [OPTIONS] <archive-name> [files-or-dirs...]

Extract an archive with progress reporting.

OPTIONS:
  -x, --extract       (optional; required for this script to work)
  -f, --file          Required. The archive filename.
  -v, --verbose       List files as they are extracted.
  -C, --directory     Change to this directory before extracting.
  -a, --auto          Try to auto-detect compression based on extension.

Examples:
  $(basename "$0") -xvf my_app.tar.gz
  $(basename "$0") -xvf my_app.tar.xz -C ./extracted/
EOF
}

# --- Argument Parsing & Validation ---
parseargs() {
  archive_name=""
  input_paths=()
  passthrough_opts=()
  local has_file_flag=0
  local next_arg_is_file=0
  local next_arg_is_dir=0

  for arg in "$@"; do
    if [[ $next_arg_is_file -eq 1 ]]; then
      archive_name="$arg"
      next_arg_is_file=0
      continue
    fi
    if [[ $next_arg_is_dir -eq 1 ]]; then
      passthrough_opts+=("$arg")
      next_arg_is_dir=0
      continue
    fi

    case "$arg" in
      --file) has_file_flag=1; next_arg_is_file=1 ;;
      --file=*) has_file_flag=1; archive_name="${arg#*=}" ;;
      -f) has_file_flag=1; next_arg_is_file=1 ;;
      -C|--directory) passthrough_opts+=("$arg"); next_arg_is_dir=1 ;;
      -*)
        if [[ "$arg" =~ f ]]; then has_file_flag=1; next_arg_is_file=1; fi
        if [[ "$arg" =~ C ]]; then next_arg_is_dir=1; fi
        passthrough_opts+=("$arg")
        ;;
      *)
        # Check if this is a dash-less tar option (e.g., "cvf", "czf")
        if [[ $has_file_flag -eq 0 ]] && [[ "$arg" =~ ^[a-zA-Z]+$ ]] && [[ "$arg" =~ [cf] ]]; then
          # This looks like dash-less tar flags
          if [[ "$arg" =~ f ]]; then
            has_file_flag=1
            next_arg_is_file=1
          fi
          # Add dash and pass through
          passthrough_opts+=("-$arg")
        else
          input_paths+=("$arg")
        fi
        ;;
    esac
  done

  if [[ $has_file_flag -eq 0 || -z "$archive_name" ]]; then
    echo "Error: The -f or --file flag is required." >&2
    return 1
  fi

  if [[ ! -f "$archive_name" ]]; then
    echo "Error: Archive not found: '$archive_name'" >&2
    return 1
  fi
}

# --- Decompressor Selection ---
get_decompressor() {
  local name="$1"
  local cmd="cat"

  case "$name" in
    *.tar.gz|*.tgz)     cmd="gzip -dc" ;;
    *.tar.bz2|*.tbz2)   cmd="bzip2 -dc" ;;
    *.tar.xz|*.txz)     cmd="xz -dc" ;;
    *.tar.zst|*.tzst)   cmd="zstd -dc" ;;
    *.tar.lzma|*.tlzma) cmd="xz -dc --format=lzma" ;;
    *) echo "Unknown extension; assuming raw tar." >&2 ;;
  esac

  echo "$cmd"
}

# --- Main Extraction Logic ---
main() {
  if [[ $# -eq 0 ]] || [[ " $* " =~ (--help|-h) ]]; then show_help; exit 0; fi

  parseargs "$@" || exit 1

  # Get archive size
  local archive_size
  archive_size=$(stat -c %s "${archive_name}" 2>/dev/null || stat -f %z "${archive_name}" 2>/dev/null)
  if ! [[ "$archive_size" =~ ^[0-9]+$ ]] || [[ "$archive_size" -eq 0 ]]; then
    echo "Error: Could not determine archive size." >&2
    exit 1
  fi

  # Set decompressor
  local decompress_cmd
  decompress_cmd=$(get_decompressor "$archive_name")

  # Cleanup options: strip compression flags
  local clean_opts
  clean_opts=$(echo "$*" | tr ' ' '\n' | grep -vE -- '-[zjJZa]|--(?:gzip|bzip2|xz|zstd|auto-compress)' | tr '\n' ' ')

  echo "Starting extraction of '$archive_name'..."
  echo "────────────────────────────────────────────────────────"

  # Pipeline: Compressed (with -s) → decompress → Written (bytes out) → tar -x
  pv -c -N "Compressed" -s "$archive_size" "$archive_name" \
    | $decompress_cmd \
    | pv -c -N "Written" \
    | tar -x -f - $clean_opts "${input_paths[@]}"

  local exit_code=${PIPESTATUS[3]}
  echo "────────────────────────────────────────────────────────"
  if [[ $exit_code -eq 0 ]]; then
    echo "✅ Success: Archive extracted."
  else
    echo "❌ Error: Extraction failed." >&2
    exit 1
  fi
}

main "$@"
