#!/usr/bin/env bash
# build.sh - Build and install tar-stats-create.sh and tar-stats-extract.sh
# Usage: ./build.sh [options]

#set -o errexit
#set -o nounset
#set -o pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PREFIX="${PREFIX:-$HOME/bin}"
BIN_DIR=".."
SCRIPTS_DIR="bin"
LOG_DIR="logs"
TAR_STATS_DEST="../tar-stats"  # Store in parent directory

# Colors
color() { echo -e "${!1}${2}${NC}"; }
warn() { color YELLOW "$1"; }
info() { color GREEN "$1"; }
error() { color RED "$1"; }

# Check dependencies
check_deps() {
  local deps=("pv" "tar")
  local extra_deps=()

  # Optional: add compression utilities
  for d in "gzip" "bzip2" "xz" "zstd"; do
    if command -v "$d" >/dev/null 2>&1; then
      extra_deps+=("$d")
    fi
  done

  for dep in "${deps[@]}"; do
    if ! command -v "$dep" >/dev/null 2>&1; then
      error "❌ Missing required dependency: '$dep'"
      exit 1
    fi
  done

  info "✅ All required dependencies found."
}

# Create directories
setup_dirs() {
  mkdir -p "$SCRIPTS_DIR" "$LOG_DIR"
}

# Install scripts from current directory
install_scripts() {
  local scripts=("tar-stats-create.sh" "tar-stats-extract.sh")
  local success=0

  for script in "${scripts[@]}"; do
    local src="$PWD/$script"
    local dest="$BIN_DIR/$script"

    if [[ ! -f "$src" ]]; then
      error "❌ Script not found: $src"
      exit 1
    fi

    if [[ ! -x "$src" ]]; then
      error "❌ Script is not executable: $src"
      exit 1
    fi

    if [[ ! -w "$BIN_DIR" ]]; then
      error "❌ Cannot write to destination: $BIN_DIR"
      exit 1
    fi

    cp "$src" "$dest" && chmod +x "$dest"
    if [[ $? -eq 0 ]]; then
      success=$((success + 1))
      info "✅ Installed: $dest"
    else
      error "❌ Failed to install: $dest"
    fi
  done

  if [[ $success -eq ${#scripts[@]} ]]; then
    info "✔ All scripts installed successfully!"
  else
    error "⚠ Some scripts failed to install."
    exit 1
  fi
}

# Create symlinks to user bin (optional)
setup_symlinks() {
  if [[ -w "$HOME/bin" ]] && [[ ! -L "$HOME/bin/tar-create" ]] && [[ ! -L "$HOME/bin/tar-extract" ]]; then
    ln -sf "$BIN_DIR/tar-stats-create.sh" "$HOME/bin/tar-create"
    ln -sf "$BIN_DIR/tar-stats-extract.sh" "$HOME/bin/tar-extract"
    info "✅ Symlinks created: tar-create, tar-extract"
  fi
}

# Show usage
usage() {
  cat << EOF
Usage: $0 [OPTIONS]

Builds and installs tar-stats-create.sh & tar-stats-extract.sh.

The 'tar-stats' wrapper script is installed in the parent directory (..).

Options:
  -h, --help           Show this help message

Example:
  ./build.sh -p /usr/local/bin
  ./build.sh --prefix $HOME/bin
EOF
}

build() {
  info "🚀 Building tar-stats..."

  check_deps
  setup_dirs
  install_scripts
  setup_symlinks

  info "🎉 Build complete!"
  cat << EOF

You can now use:
  tar-create -czvf my.tar.gz dir/
  tar-extract -xvf my.tar.gz

Or use the wrapper script:
  ../tar-stats -czvf my.tar.gz dir/

Alternatively, use full names:
  bin/tar-stats-create.sh -czvf my.tar.gz dir/
  bin/tar-stats-extract.sh
   -xvf my.tar.gz

For help:
  tar-create --help
  tar-extract --help
  ../tar-stats --help
EOF
}

build

if [ "$1" == "1" ]; then
    echo "Done"
    exit
fi

# Watch for changes to .sh files in the directory and subdirectories
inotifywait --recursive --monitor --format "%e %w%f" \
    --event modify,move,create,delete . \
    --include '\.sh$' |
    while read changed; do
        echo "Detected change in $changed"
        build
    done
