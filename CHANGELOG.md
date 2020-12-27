### v1.0.0 @ 2020-09-30
* [2020-09-20 10:47:15 CDT] - Initial:
    * [ls-by-min] Sort `ls` by file size, descending.
    * [stream-to-youtube.sh] Live Screencast directly to YouTube from the CLI (via ffmpeg).
    * [watermark.sh] Easily embed your own image watermark onto videos (via ffmpeg).
    * [x265.sh] Effectively highly-compress (with acceptable visual loss) videos to H.265 HEVC using Intel's VAAPI. 
* [2020-09-23 14:59:35 CDT] - [x265] Pass all extra parameters directly to ffmpeg.
* [2020-09-23 15:00:18 CDT] - Added a utility to download all of a user's or organization's GitHub repos.
* [2020-09-23 15:01:15 CDT] - [sync-watch] See how much data is waiting to be written to disks.
* [2020-09-23 15:01:37 CDT] - [random.sh] Picks a random file in a given directory.
* [2020-09-30 12:41:40 CDT] - Only prompt once per reboot for the sudo password.
* [2020-09-30 23:19:40 CDT] - Added a utility to automatically move your btrfs / into subvolumes.
* [2020-09-30 23:37:15 CDT] - Moved the clear-cache script to ensure it runs first.
* [2020-09-30 23:37:53 CDT] - [clear-cache] Also delete Pacman's downloads.
* [2020-09-30 23:41:29 CDT] - [purge-locales] Automatically remove every non-English locale daily.
* [2020-09-30 23:42:34 CDT] - [btrfs-snapshot] Take snapshots of / every hour and every day.

### v1.1.0 @ 2020-10-01
* [2020-10-01 00:23:15 CDT] - [x265.sh] Use VAAPI for encoding using Intel graphics cards.
* [2020-10-01 00:23:32 CDT] - Added copyright headers.
* [2020-10-01 00:30:00 CDT] - Created a README.md.
* [2020-10-01 00:37:07 CDT] - [random-file] renamed for more clarity.
* [2020-10-01 00:44:34 CDT] - Flushed out the README.
* [2020-10-01 00:49:44 CDT] - [bash_rc.aliases] Added a whole slew of webdev aliases.
* [2020-10-01 00:58:00 CDT] - [bash_rc.aliases] Added some more descriptions.
* [2020-10-01 01:10:26 CDT] - [.gitconfig] Added a whole bunch of my git aliases. tag: v1.0.0
* [2020-10-01 08:13:51 CDT] - [clear-cache] Use nullfs if it is available.
* [2020-10-01 08:17:42 CDT] - [clear-cache] Delete broken symlinks in the ~/.cache directories.
* [2020-10-01 08:18:38 CDT] - [btrfs-snapshot] Improved the handling of snapshots at day terminuses.

### v1.1.1 @ 2020-10-05
* [2020-10-01 08:38:03 CDT] - [changelog-maker-lite] Added a utility for making pretty CHANGELOGs.

### v2.0.0 @ 2020-10-22
* [2020-10-20 20:10:54 CDT] - [arch-pacman-dupe-cleaner] Utility for resolving "error: duplicated database entry 'foo'"
* [2020-10-22 15:59:58 CDT] - [Major] Relicensed to the Creative Commons Attribution v4.0 International License.
* [2020-10-22 01:01:01 CDT] - [git-mtime] Restores the file modification times of your git workdir to the repo's.
* [2020-10-22 04:34:32 CDT] - [ssh-keyphrase-only-once] Only type in your SSH keyphrase once per boot.
* [2020-10-22 16:22:09 CDT] - [turn-off-monitors] Easily turn off all of your monitors via the CLI.
* [2020-10-22 18:36:34 CDT] - Added a Table of Contents to the README. HEAD -> v2.0

Behavioral changes:
* [2020-10-22 14:53:09 CDT] - [changelog-maker-lite] Now outputs Markdown lists.

### v2.1.0 @ 2020-10-23
* [2020-10-23 12:31:25 CDT] - [m] Refactored to use /usr/bin/env shebang.
* [2020-10-23 12:39:46 CDT] - [wifi-autorun-on-connect] Autorun a script when you connect to a Wifi hotspot.
* [2020-10-23 18:40:30 CDT] - Translated the README into Chinese and Hindi to support 3 Billion people. HEAD -> v2.1

## v2.1.1 @ 2020-12-27
* [2020-12-26 17:00:11 CST] - [git-shallow-pull] Added a utility to shallow update git.
* [2020-12-27 12:51:48 CST] - [git-change-author] Easily bulk change the author's name and email in a git repo. HEAD -> v2.1 

