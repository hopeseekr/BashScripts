#!/usr/bin/env bash
#
# test_tar-stats.sh - A test suite for the tar-stats script.
#
# This script sets up a temporary test environment, runs a series of tests
# against the 'tar-stats' script with various argument styles, and reports
# the success or failure of each test.
#

# --- Configuration ---
TARP_SCRIPT="./tar-stats"
TEST_DIR="_test_tar-stats_workdir"
PASS_COUNT=0
FAIL_COUNT=0

# --- Helper Functions ---
# A simple color system
c_red="\033[1;31m"
c_green="\033[1;32m"
c_yellow="\033[1;33m"
c_reset="\033[0m"

log_pass() {
  echo -e "  [${c_green}PASS${c_reset}] $1"
  ((PASS_COUNT++))
}

log_fail() {
  echo -e "  [${c_red}FAIL${c_reset}] $1"
  ((FAIL_COUNT++))
}

log_info() {
  echo -e "${c_yellow}==>${c_reset} $1"
}

# --- Setup and Teardown ---
setup() {
  log_info "Setting up test environment in '$TEST_DIR'..."
  rm -rf "$TEST_DIR"
  mkdir -p "$TEST_DIR"
  cd "$TEST_DIR" || exit 1

  # Create some test files and directories
  mkdir -p src/subdir
  dd if=/dev/urandom of=src/file1.bin bs=1K count=100 status=none
  echo "This is a test text file." > src/file2.txt
  echo "Another file in a subdirectory" > src/subdir/file3.txt
  ln -s src/file1.bin src/file1.link

  # Make sure tar-stats is executable
  if [[ ! -x "../$TARP_SCRIPT" ]]; then
    echo "Error: Script '$TARP_SCRIPT' not found or not executable." >&2
    exit 1
  fi
}

teardown() {
  log_info "Cleaning up test environment..."
  cd ..
  rm -rf "$TEST_DIR"
}

# --- Test Case Function ---
# Usage: run_test "Test Name" "archive.name" "expected_content_file" <tar-stats_args...>
run_test() {
  local test_name="$1"
  local archive_name="$2"
  local content_check="$3"
  shift 3
  local tar-stats_args=("$@")

  echo "Running Test: $test_name"

  # Run the tar-stats command
  "../$TARP_SCRIPT" "${tar-stats_args[@]}" > /dev/null 2>&1

  # Check 1: Archive file was created
  if [[ -f "$archive_name" ]]; then
    log_pass "Archive file '$archive_name' was created."
  else
    log_fail "Archive file '$archive_name' was NOT created."
    return
  fi

  # Check 2: Archive content is valid
  # We decompress and check the list of files
  local tar_list_cmd=""
  case "$archive_name" in
    *.tar.gz|*.tgz) tar_list_cmd="tar -tzf";;
    *.tar.bz2|*.tbz2) tar_list_cmd="tar -tjf";;
    *.tar.xz|*.txz) tar_list_cmd="tar -tJf";;
    *.tar) tar_list_cmd="tar -tf";;
    *) log_fail "Unknown archive type for content check."; return;;
  esac

  # Get the list of files from the created archive and sort them
  local archive_contents
  archive_contents=$($tar_list_cmd "$archive_name" 2>/dev/null | sort)

  if [[ "$archive_contents" == "$content_check" ]]; then
    log_pass "Archive content is correct."
  else
    log_fail "Archive content is INCORRECT."
    echo "  Expected: $content_check"
    echo "  Got: $archive_contents"
  fi
}

# --- Main Test Execution ---
# Prepare the environment
trap teardown EXIT
setup

# Define the expected contents of the archive (sorted)
# This ensures all tests are validated against the same ground truth.
EXPECTED_CONTENTS=$(tar -cf - src | tar -tf - | sort)

log_info "Starting Tests..."

# Test Case 1: Standard GNU/Linux style, gzip
run_test "Standard gzip (-czf)" \
  "test1.tar.gz" "$EXPECTED_CONTENTS" \
  -czf test1.tar.gz src

# Test Case 2: Traditional dash-less style, bzip2
run_test "Dash-less bzip2 (cjf)" \
  "test2.tar.bz2" "$EXPECTED_CONTENTS" \
  cjf test2.tar.bz2 src

# Test Case 3: Long options, xz
# Skip if xz is not available
if command -v xz &>/dev/null; then
  run_test "Long options xz (--create --xz --file)" \
    "test3.tar.xz" "$EXPECTED_CONTENTS" \
    --create --xz --file=test3.tar.xz src
else
  log_info "Skipping xz test: 'xz' command not found."
fi


# Test Case 4: Separated flags, uncompressed
run_test "Separated flags, no compression (-c -v -f)" \
  "test4.tar" "$EXPECTED_CONTENTS" \
  -c -v -f test4.tar src

# Test Case 5: File flag first
run_test "File flag first (-f ... -c)" \
  "test5.tar.gz" "$EXPECTED_CONTENTS" \
  -f test5.tar.gz -cz src

# Test Case 6: Auto-compress (-a)
run_test "Auto-compress flag (-a)" \
  "test6.tar.xz" "$EXPECTED_CONTENTS" \
  -caf test6.tar.xz src


log_info "Test suite finished."
echo -e "Results: ${c_green}${PASS_COUNT} Passed${c_reset}, ${c_red}${FAIL_COUNT} Failed${c_reset}."

# Exit with a non-zero status if any tests failed
if [[ $FAIL_COUNT -gt 0 ]]; then
  exit 1
fi
