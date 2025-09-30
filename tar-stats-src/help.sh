#!/usr/bin/env bash
#########################################################################
# tar-stats: A 'tar' Wrapper for Creation and Extraction                #
#                                                                       #
# A transparent wrapper for 'tar' to add progress bars for both creating#
# and extracting archives.                                              #
#                                                                       #
# This script intercepts 'tar' commands to provide progress bars using  #
# 'pv' (Pipe Viewer), without changing the original 'tar' command       #
# syntax. It is fully portable and handles tar's flexible argument      #
# style, including the traditional dash-less format (e.g., 'tar cvf').  #
#                                                                       #
# Part of HopeSeekr's BashScripts Collection                            #
# https://github.com/hopeseekr/BashScripts/                             #
#                                                                       #
# Copyright © 2025 Theodore R. Smith <theodore@phpexperts.pro>          #
# GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690   #
#                                                                       #
# License: Creative Commons Attribution v4.0 International              #
#########################################################################

show_help() {
  cat << 'EOF'
Usage: $(basename "$0") [MODE] [OPTIONS] <archive-name> [files-or-dirs...]

A transparent wrapper for 'tar' that enhances archive creation (-c) and
extraction (-x) with progress bars using 'pv'. It accepts the same arguments
as 'tar', including the traditional dash-less style.

MODE (must be specified):
  -c, --create        Create a new archive.
  -x, --extract       Extract files from an archive.

COMMON OPTIONS:
  -f, --file          Required. The name of the archive file.
  -v, --verbose       List files as they are processed.
  -C, --directory     For extraction, change to this directory first.
  -z, -j, -J, -a      Compression flags (optional for extraction).

Examples:
  Create:  $(basename "$0") -czvf my_app.tar.gz ./my_app
  Extract: $(basename "$0") -xvf my_app.tar.gz
EOF
}

show_help
