#!/usr/bin/env bash
#########################################################################
# tar-stats-create: A 'tar' Wrapper for Archive Creation                #
#                                                                       #
# Transparently adds a progress bar during archive creation using 'pv'. #
# Supports: -c -f [-v] [-z] [-j] [-J] [-Z] [-a] and dash-less variants. #
#                                                                       #
# Based on tar-stats by Theodore R. Smith                              #
# https://github.com/hopeseekr/BashScripts/                             #
#########################################################################

set -o pipefail

# --- Help/Usage Function ---
show_help() {
  cat << EOF
Usage: $(basename "$0") [OPTIONS] <archive-name> [files-or-dirs...]

Create a compressed archive with progress reporting.

OPTIONS:
  -c, --create        (optional; required for this script to work)
  -f, --file          Required. The output archive filename.
  -v, --verbose       List files as they are processed.
  -z, --gzip          Compress using gzip.
  -j, --bzip2         Compress using bzip2.
  -J, --xz            Compress using xz.
  -Z, --zstd          Compress using zstd.
  -a, --auto-compress Automatically determine compression based on .tar.gz, .xz, etc.

Examples:
  $(basename "$0") -czvf my_app.tar.gz ./my_app
  $(basename "$0") -jvf my_app.tar.bz2 ./my_app
  $(basename "$0") -a my_app.dddtar.gz ./my_app
EOF
}

# --- Argument Parsing & Validation ---
parseargs() {
  archive_name=""
  input_paths=()
  passthrough_opts=()
  local has_file_flag=0
  local next_arg_is_file=0

  for arg in "$@"; do
    if [[ $next_arg_is_file -eq 1 ]]; then
      archive_name="$arg"
      next_arg_is_file=0
      continue
    fi

    case "$arg" in
      --file) has_file_flag=1; next_arg_is_file=1 ;;
      --file=*) has_file_flag=1; archive_name="${arg#*=}" ;;
      -f) has_file_flag=1; next_arg_is_file=1 ;;
      -*)
        if [[ "$arg" =~ f ]]; then has_file_flag=1; next_arg_is_file=1; fi
        passthrough_opts+=("$arg")
        ;;
      *)
        input_paths+=("$arg")
        ;;
    esac
  done

  if [[ $has_file_flag -eq 0 || -z "$archive_name" ]]; then
    echo "Error: The -f or --file flag is required." >&2
    return 1
  fi

  if [[ ${#input_paths[@]} -eq 0 ]]; then
    echo "Error: At least one file or directory is required." >&2
    return 1
  fi

  for path in "${input_paths[@]}"; do
    if [[ ! -e "$path" ]]; then
      echo "Error: File/directory not found: '$path'" >&2
      return 1
    fi
  done
}

# --- Compressor Selection ---
get_compressor() {
  local opts="$*"
  local cmd="cat"
  local name="None"

  if [[ "$opts" =~ --gzip|-z|z ]]; then
    cmd="gzip"
    name="Gzip"
  elif [[ "$opts" =~ --bzip2|-j|j ]]; then
    cmd="bzip2"
    name="Bzip2"
  elif [[ "$opts" =~ --xz|-J|J ]]; then
    cmd="xz -T0 -c"
    name="XZ"
  elif [[ "$opts" =~ --zstd|-Z|Z ]]; then
    cmd="zstd"
    name="Zstd"
  elif [[ "$opts" =~ --auto-compress|-a|a ]]; then
    case "$archive_name" in
      *.tar.gz|*.tgz)   cmd="gzip";    name="Gzip" ;;
      *.tar.bz2|*.tbz2)  cmd="bzip2";   name="Bzip2" ;;
      *.tar.xz|*.txz)    cmd="xz -T0 -c"; name="XZ" ;;
      *.tar.zst|*.tzst)  cmd="zstd";    name="Zstd" ;;
      *) echo "Warning: Auto-detection failed for '$archive_name'." >&2 ;;
    esac
  else
    echo "No compression specified." >&2
    return 1
  fi

  echo "$cmd|$name"
}

# --- Main Creation Logic ---
main() {
  if [[ $# -eq 0 ]] || [[ " $* " =~ (--help|-h) ]]; then show_help; exit 0; fi

  parseargs "$@" || exit 1

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

  # If no compressor, still allow no compression (e.g., .tar)
  if [[ "$compressor_cmd" == "cat" ]]; then
    echo "Creating uncompressed archive '${archive_name}'..."
  else
    echo "Creating compressed archive '${archive_name}' with ${compressor_name}..."
  fi

  echo "--------------------------------------------------------"

  # Build tar command with final options and pipe through pv stages
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

main "$@"
