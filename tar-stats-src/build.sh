#!/usr/bin/env bash
#########################################################################
# build.sh: Build the tar-stats unified script                          #
#                                                                       #
# Combines create.sh, extract.sh, and help.sh into a single            #
# tar-stats executable with dash-optional support.                     #
#########################################################################

set -e

OUTPUT_FILE="tar-stats"
BUILD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building tar-stats from source files..."

# Verify source files exist
if [[ ! -f "$BUILD_DIR/create.sh" ]]; then
    echo "Error: create.sh not found!" >&2
    exit 1
fi

if [[ ! -f "$BUILD_DIR/extract.sh" ]]; then
    echo "Error: extract.sh not found!" >&2
    exit 1
fi

if [[ ! -f "$BUILD_DIR/help.sh" ]]; then
    echo "Error: help.sh not found!" >&2
    exit 1
fi

# Extract the header from help.sh (everything up to show_help function)
extract_header() {
    sed -n '1,/^show_help()/p' "$BUILD_DIR/help.sh" | sed '$d'
}

# Extract show_help function from help.sh
extract_help_function() {
    sed -n '/^show_help()/,/^}$/p' "$BUILD_DIR/help.sh"
}

# Extract functions from create.sh (skip shebang, header comments, and main function)
extract_create_functions() {
    sed -n '/^# --- Help\/Usage Function ---/,/^main() {/p' "$BUILD_DIR/create.sh" | sed '$d'
}

# Extract functions from extract.sh (skip shebang, header comments, and main function)
extract_extract_functions() {
    sed -n '/^# --- Help\/Usage Function ---/,/^main() {/p' "$BUILD_DIR/extract.sh" | sed '$d'
}

# Start building the output file
cat > "$OUTPUT_FILE" << 'HEADER_END'
HEADER_END

# Add header from help.sh
extract_header >> "$OUTPUT_FILE"

# Add blank line
echo "" >> "$OUTPUT_FILE"

# Add main show_help function
extract_help_function >> "$OUTPUT_FILE"

echo "" >> "$OUTPUT_FILE"

# Add all functions from create.sh (excluding help and main)
echo "# --- CREATE MODE FUNCTIONS ---" >> "$OUTPUT_FILE"
sed -n '/^parseargs()/,/^main() {/p' "$BUILD_DIR/create.sh" | sed '$d' >> "$OUTPUT_FILE"

echo "" >> "$OUTPUT_FILE"

# Add all functions from extract.sh (excluding help and main)
echo "# --- EXTRACT MODE FUNCTIONS ---" >> "$OUTPUT_FILE"
sed -n '/^# --- Decompressor Selection ---/,/^main() {/p' "$BUILD_DIR/extract.sh" | sed '$d' >> "$OUTPUT_FILE"

echo "" >> "$OUTPUT_FILE"

# Add the unified main function
cat >> "$OUTPUT_FILE" << 'MAIN_FUNCTION'
# --- CREATE MODE WRAPPER ---
mode_create() {
  parseargs "$@" || exit 1

  # Validate input paths exist
  for path in "${input_paths[@]}"; do
    if [[ ! -e "$path" ]]; then
      echo "Error: File/directory not found: '$path'" >&2
      exit 1
    fi
  done

  # Get total size
  echo "Calculating total size..."
  local total_size
  total_size=$(du -sbc "${input_paths[@]}" | tail -n 1 | awk '{print $1}')
  if ! [[ "$total_size" =~ ^[0-9]+$ ]] || [[ "$total_size" -eq 0 ]]; then
    echo "Error: Could not calculate archive size." >&2
    exit 1
  fi

  # Set up compressor
  local result
  result=$(get_compressor "$*")
  local compressor_cmd="${result%%|*}"
  local compressor_name="${result#*|}"

  if [[ "$compressor_cmd" == "cat" ]]; then
    echo "Creating uncompressed archive '${archive_name}'..."
  else
    echo "Creating compressed archive '${archive_name}' with ${compressor_name}..."
  fi

  echo "--------------------------------------------------------"

  # Build tar command with progress
  tar -c -f - "${input_paths[@]}" \
    | pv -c -N "Input (tar)" -s "$total_size" \
    | $compressor_cmd \
    | pv -c -N "Output (${compressor_name})" \
    > "$archive_name"

  local exit_code=${PIPESTATUS[2]}
  echo "────────────────────────────────────────────────────────"
  if [[ $exit_code -eq 0 ]]; then
    echo "✅ Success: Archive created."
  else
    echo "❌ Error: Archive creation failed." >&2
    exit 1
  fi
}

# --- EXTRACT MODE WRAPPER ---
mode_extract() {
  parseargs "$@" || exit 1

  # Validate archive exists
  if [[ ! -f "$archive_name" ]]; then
    echo "Error: Archive not found: '$archive_name'" >&2
    exit 1
  fi

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

  # Pipeline: Compressed → decompress → Written → tar -x
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

# --- MAIN ENTRY POINT ---
main() {
  if [[ $# -eq 0 ]] || [[ " $* " =~ (--help|-h) ]]; then
    show_help
    exit 0
  fi

  # Detect mode (create or extract)
  # Support both dashed (-cvf, -xvf) and dash-less (cvf, xvf) formats
  local mode=""
  for arg in "$@"; do
    case "$arg" in
      -c|--create) mode="create"; break ;;
      -x|--extract) mode="extract"; break ;;
      -*c*) mode="create"; break ;;
      -*x*) mode="extract"; break ;;
      *)
        # Check for dash-less format (e.g., cvf, xvf)
        if [[ "$arg" =~ ^[a-zA-Z]+$ ]]; then
          if [[ "$arg" =~ c ]]; then
            mode="create"
            break
          elif [[ "$arg" =~ x ]]; then
            mode="extract"
            break
          fi
        fi
        ;;
    esac
  done

  if [[ -z "$mode" ]]; then
    echo "Error: Must specify either -c (create) or -x (extract) mode." >&2
    echo "Use --help for usage information." >&2
    exit 1
  fi

  # Dispatch to appropriate mode
  if [[ "$mode" == "create" ]]; then
    mode_create "$@"
  else
    mode_extract "$@"
  fi
}

main "$@"
MAIN_FUNCTION

# Make executable
chmod +x "$OUTPUT_FILE"

echo "✅ Build complete: $OUTPUT_FILE"
echo "   Source files compiled:"
echo "   - create.sh"
echo "   - extract.sh"
echo "   - help.sh"
echo ""
echo "   Dash-optional support enabled:"
echo "   - tar-stats -cvf archive.tar.gz dir/"
echo "   - tar-stats cvf archive.tar.gz dir/"
echo "   - tar-stats -xvf archive.tar.gz"
echo "   - tar-stats xvf archive.tar.gz"
