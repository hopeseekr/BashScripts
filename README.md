# HopeSeekr's Bash Scripts Collection

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

![Hope's Logo](https://avatars2.githubusercontent.com/u/50506504?s=200&v=4)

They are sorted by how much utility they provide me.

Translations: [中文](README.cn.md), [हिन्दी](README.hi.md), [espanol](README.es.md)

Recent Changes
==============
## v3.1.0 @ 2025-11-14

* **[2025-11-14 23:01:12 CST]** [clone-github-repos] Do not shallow clone.
* **[2025-11-14 22:58:55 CST]** [change-maker-lite] Dramatically refactored + added correct DST time zone.
* **[2025-11-14 17:33:38 CST]** [git-commit-at-modded-time] Added support for more than 1 file.
* **[2025-10-11 00:54:45 CDT]** [git-change-author] Now no need for rebase window and maintains commit timestamps like `git-same-sig-time`.

## v3.0.0 @ 2025-09-30

* **[2025-09-30 20:54:18 CDT]** [turn-off-nvidia] Added the README documentation.
* **[2025-09-30 20:52:11 CDT]** [image-mp3-to-video] Combines an image with an mp3 to produce an H264 video.
* **[2025-09-30 18:51:33 CDT]** [tar-stats] Much more work, but still not ready.
* **[2025-09-28 06:29:56 CDT]** [git-filter-copy] A utility to copy workdirs complying with .giattributes export restrictions.
* **[2025-08-19 05:26:47 CDT]** [turn-off-nvidia] More refactoring.
* **[2025-08-12 15:47:45 CDT]** [turn-off-nvidia] Major rewrite with Wayland support and modern power management
* **[2025-08-12 14:38:35 CDT]** [turn-off-nvidia] Power savings for Xorg.
* **[2025-08-12 14:35:28 CDT]** [tar-stats] Split into multiple source code files and added a compilation step.
* **[2025-08-12 12:57:09 CDT]** [git-shift-time] Added a utility to shift the timestamp of git commits.
* **[2025-08-10 13:06:25 CDT]** [turn-off-nvidia] Added a utility to turn off Nvidia graphics card to greatly extend battery life.
* **[2025-08-09 21:40:28 CDT]** [tar-stats] Iteration 3 - Added auto-detection for the compression utility to use when decompressing.
* **[2025-08-09 18:47:24 CDT]** [tar-stats] Iteration 2 - Added extraction support.
* **[2025-08-09 18:46:09 CDT]** [tar-stats] Iteration 1 - Added compression support.
* **[2025-08-09 14:16:16 CDT]** [obs-global-hotkeys] A utility that adds Global Hotkeys for OBS on Wayland.

## v2.8.0 @ 2025-07-29

* **[2025-07-29 20:24:07 CDT]** [my-ip] Added a little utility to discover your private IP address.

## v2.7.3 @ 2025-05-12

* **[2025-02-08 15:26:11 CDT]** [arch-upgrade-postgres] Made it better.
* **[2025-05-12 08:27:50 CDT]** [sync-watch] Use system "watch" instead of any Bash alias. 

#### v2.7.2 @ 2025-01-27

* **[2024-12-07 19:41:20 CST]** [turn-off-monitors] Added compatibility to KDE Desktop.
* **[2025-01-19 21:58:12 CET]** [turn-off-monitors] Added support for touch screen wakeup.
* **[2025-01-25 19:18:27 CST]** [wifi-show-password] Added a utility to show the current wifi password.
* **[2025-01-27 10:56:29 CST]** [arch-upgrade-postgres] Added a utility to automatically upgrade postgres on Arch Linux.

#### v2.7.1 @ 2024-09-13

* **[2024-08-29 07:49:02 CDT]** [bash-timer] Added support for locales with the comma decimal separator.
* **[2024-09-01 12:31:33 CDT]** [bash-timer] Properly pad ms to 3 digits.
* **[2024-09-01 12:41:07 CDT]** [bash-timer] Greatly refactored ns math to properly calculate seconds and ms.
* **[2024-09-10 02:20:14 CDT]** [bash-timer] Fixed the "value too great" error.
* **[2024-09-11 02:22:12 CDT]** [bash-timer] Supported non-decimal locales, properly in Bash v5.

#### v2.7.0 @ 2024-08-24

* **[2024-08-24 12:06:32 CDT]** [bash-timer] Added the bash-timer project.


Table of Contents (Categorized)
===============================

* **Super Productivity**
    * **[bash_profile](#bash_profile)** — High-quality `.bash_profile` and `.bashrc` for power users.
    * **[bash_rc.aliases](#bash_rcaliases)** — High-Octane .bashrc aliase and functions for a better Quality of Life.
    * **[bash-timer](#bash-timer)** — Easily add Human-readable execution time for every command in bash!
    * **[ssh-autologin](#ssh-autologin)** — Automatically set up SSH autologins.
    * **[ssh-keyphrase-only-once](#ssh-keyphrase-only-onceinstaller)** — Only prompt for your SSH keyphrase once per boot.
    * **[gitconfig](#gitconfig)** — High-Octane Git CLI Configuration.
* **Git Quality of Life**
    * **[git-change-author](#git-change-author)** — Easily bulk change the author's name and email in a git repo.
    * **[git-commit-at-modded-time](#git-commit-at-modded-time)** — Use a file's modified time as the git time.
    * **[git-filter-copy](#git-filter-copy)** — Copies Git workdirs, preserving clean state and local modifications while respecting .gitattributes export rules.
    * **[git-mtime](#git-mtime-git-modified-time-restorer)** — Restores every file's modification time to that of the repo's history.
    * **[git-same-sig-time](#git-same-sig-time)** — Unifies the GPG signature time with the commit's time.
    * **[git-shallow-pull](#esotericgit-shallow-pull)** — Shallow updates a shallow `git clone --depth 1` repository.
    * **[git-shift-time](#git-shift-time)** — Adjusts git commit timestamps by minutes or to a specific date.
* **CronTabs**
    * **[cron.daily/00_clear-cache](#crondaily00_clear-cache)** — Remove useless cache files nightly.
    * **[cron.daily/01_purge-locales](#crondaily01_purge-locales)** — Remove worthless intl locales.
    * **[cron.hourly/btrfs-snapshot](#cronhourlybtrfs-snapshot)** — Backup your BTRFS / hourly.
    * **[cron.daily/btrfs-snapshot](#crondailybtrfs-snapshot)** — Backup your BTRFS  / daily.
    * **[cron.hourly/php-clean-tmp](#cronhourlyphp-clean-tmp)** — Cleans PHP temp files on busy servers.
* **Quality of Life**
    * **[launch-browser](#launch-browser)** — Browser launcher utility script that launches browsers in full-Wayland.
    * **[ls-by-min](#ls-by-min)** — Sorts the output of  `ls` by file size, descending.
    * **[my-ip](#my-ip)** — Easily fetch this machine's public IP address.
    * **[obs-global-hotkeys](#obs-global-hotkeys)** — OBS Global Hotkeys Installer (GNOME Wayland + Xorg)
    * **[random-file](#random-file)** — Randomly picks a file or directory and displays it.
    * **[sudoers.d/00_prompt_once](#sudoersd00_prompt_once)** — Only prompt for your sudo password once per boot.
    * **[sync-watch](#sync-watch)** — Outputs a tiny, updating display of how many MBs need to be written to disks.
    * **[tar-sorted](#tar-sorted)** — Create tar files automatically sorted by file name.
    * **[turn-off-monitors](#turn-off-monitors)** — Turns off all monitors via the Command Line (CLI).
    * **[turn-off-nvidia](#turn-off-nvidia)** — Comprehensive NVIDIA power-saving modes for Xorg/Wayland, prioritizing RTD3.
    * **[wifi-show-password](#wifi-show-password)** — Shows the currently connected wifi password.
* **Uber Scripts** (很好的控制台脚本)
    * **[american-date](#american-date)** — A utility to print out dates in the American format.
    * **[changelog-maker-lite](#changelog-maker-lite)** — Quickly creates a beautiful changelog from the commit history.
    * **[image-mp3-to-video](#image-mp3-to-video)** — Combines an image with an mp3 to create a H264 video.
    * **[stream-to-youtube](#stream-to-youtube)** — Live Screencast directly to YouTube from the CLI. 
    * **[watermark.sh](#watermarksh)** — Easily embed your own image watermark onto videos.
    * **[wifi-autorun-on-connect](#wifi-autorun-on-connectinstaller)** — Autorun a script when you connect to a Wifi hotspot.
    * **[x265.sh](#x265sh)** — Transcode to h265 HEVC via the Intel graphics card using VAAPI.
* **Esoteric Utilities**
    * **[arch-pacman-dupe-cleaner](#esotericarch-pacman-dupe-cleaner)** — Remove duplicated Arch Linux Pacman entries.
    * **[arch-upgrade-postgres](#esotericarch-upgrade-postgres)** — Automates the upgrading PostgreSQL from one version to the next in Arch Linux.
    * **[init-btrfs-rootfs](#esotericinit-btrfs-rootfs)** — Puts everything into organized BTRFS subvolumes + turns on snapshotting.
    * **[clone-github-repos.php](#esotericclone-github-reposphp)** — Downloads all of a user's/org's GitHub repositories.
* **Bash Framework**
    * **[is_root](#is_root)** — Provides the `is_root` function for determining if the current user has root access.
    * **[wait_until_mouse_or_keyboard_event](#wait_until_mouse_or_keyboard_event)** — Block execution until a key is pressed, the mouse is moved, or a mouse button is clicked.

* [License](#license) — Creative Commons v4.0 International
* [About The Author](#about-the-author)

## bash_profile

Ties many of the BashScripts together for a super powerful system.

## bash_rc.aliases

This is arguably the most valuable piece of the project!

These dozens of aliases make working with Linux and developing
web app software much more efficient and streamlined.

Go check it out! [bash_rc.aliases](bash_rc.aliases)

## bash-timer

Easily add Human-readable execution time for every command in bash!

The time will show up in the bottom left, immediately left of your $PS1.

![bash-timer image](https://user-images.githubusercontent.com/1125541/93687425-7c392100-fa83-11ea-9d36-cacbe03cc725.png)
```
2 days 05:02:11.33 # A very long process
```

**To Install:**

```bash
curl https://raw.githubusercontent.com/hopeseekr/bash-timer/v1.5.0/install | bash
```

[**View the README.md**](bash-timer/README.md) for more information.

## ssh-autologin

Automatically sets up (if needed) a SSH private key and installs it
on the remote server (creating the .ssh, if needed, as well.

## ssh-keyphrase-only-once.installer

Properly configures your OpenSSH client and installs `ssh-agent` in your `~/.bash_profile` in such a way
that you will only ever have to enter your SSH keyphrase once per login for anything that works with `ssh-agent`. 

## gitconfig

A highly-optimized .gitconfig for seasoned software developers ready to increase their daly productivity.
Install into ~/.gitconfig.

    git pretty
    git ll

Shows a beautiful multi-colored log with standard ISO dates:

![git pretty](https://user-images.githubusercontent.com/1125541/94773688-e904c300-0381-11eb-878a-d0396d2bf102.png)

    git fix

Quickly jumps into rebasing the last two commits into one another.

    git alterego

Quickly switch the current repo to using your main alterego account for an previously-committed commit.

    git ego

The reverse of `git alterego`.

    git resign <hash>

Quickly resign bulk commits from <hash> to the latest.

This is particularly utilitarian when your GPG key expires and you need to renew it and then resign.

    git c: checkout
    git cp: cherry-pick
    git cpm: cherry-pick for Merge commits

Utility aliases to make git more efficient to use.

    git shows

Shows the GPG signature for every commit in `git log`.

## git-change-author

Easily bulk change the author's name and email of any of the commits in a git repository.

Usage: `git-change-author "Your Name" "email@address" [SHA1]`

## git-commit-at-modded-time

Use a file's modified time as the git time.

Example:

    $ ls -l american-date
     #-rwxrwxr-x+ 1 1MB Oct 14  2020  american-date
    $ ./git-commit-at-modded-time american-date
    $ git pretty american-date
    7462b66 G 2020-10-14 15:53:34 -0500 Theodore R. Smith

## git-filter-copy

This utility is designed to copy directories while accounting for whether the source directory is a Git repository or not. If the source is a Git repository, it exports the current state of the project from the working directory, including any local modifications that are tracked by Git and not marked with export-ignore in .gitattributes.

This means copying files that have been committed to the repository (or modified locally but still tracked), while excluding files that were never committed or explicitly ignored via .gitattributes. This ensures you get only the relevant and intended project files for local testing.


## git-mtime Git Modified Time Restorer

Restores each file's modification time in your working directory to when it was
last updated in the remote git repository.

When you checkout a repository & run this, your workdir goes from:

    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 CHANGELOG.txt
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 git-mtime

To:

    -rwxrwxr-x+ 1 tsmith users 1MB Oct  1 08:38 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct  1 01:10 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Sep 30 23:19 git-mtime

## git-same-sig-time

Unifies the GPG signature time with the commit's time.

Before:

     gpg: Signature made Fri 19 Jan 2024 06:50:44 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     43578ec G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Fri 19 Jan 2024 06:50:25 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     8ab4104 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

After:

     gpg: Signature made Tue 16 Jan 2024 01:52:41 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     515e36b G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Mon 15 Jan 2024 08:27:07 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     22c5040 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

## git-shift-time

Adjusts git commit timestamps by minutes or to a specific date while preserving GPG signatures.

This utility allows you to shift commit times forward or backward by a specified number of minutes,
or set them to a specific date/time. It's useful for fixing commit timestamps after working in 
different timezones, aligning commits to specific times, or correcting mistimed commits.

```bash
git-shift-time <commit-hash> <minutes-offset> [target-date]
```

## tar-sorted
 
Create tar files automatically sorted by file name.

This is particularly helpful on random-order file systems, such as ext4.

With the Bettergist Collector, we use this to be able to roughly estimate
how long compressing and extracting multiple-gigabyte files with millions
of files will take.

It is a drop-in replacement for `tar`, and uses the same arguments.

Optionally, you can install the function directly into your ~/.bashrc.

## cron.daily/00_clear-cache

- Empties out the ~/.cache directory of every non-root user.
- Empties out Pacman's package cache directory.

This can optionally use [nullfsvfs](https://github.com/abbbi/nullfsvfs) in order to limit wear-and-tear on SSDs.

## cron.daily/01_purge-locales

Removes every non-EN locale file every day.

This saves, usually, 400-1000 MB of space.

## cron.hourly/btrfs-snapshot

Takes BTRFS snapshots of / every hour on the hour.

## cron.daily/btrfs-snapshot

Cleans up the prior day's hourly snapshots while keeping the daily ones.

## cron.hourly/php-clean-tmp

Cleans up otherwise-useless PHP temp files, which is very useful on busy servers.
* Old session files that haven't been modified in the last hour.
* phpunit temp files.
* phpstan temp files.

## american-date

A utility to print out dates in the American format

    Fri, 19 January 2024 05:49:20 CST

## changelog-maker-lite

Easily creates [CHANGELOGs](CHANGELOG.md) based upon concise git commit logs:

    [2020-10-01 00:23:15 CDT] — [x265.sh] Use VAAPI for encoding using Intel graphics cards.
    [2020-10-01 00:30:00 CDT] — Created a README.md.
    [2020-10-01 00:37:07 CDT] — [random-file] renamed for more clarity.
    [2020-10-01 00:44:34 CDT] — Flushed out the README.
    [2020-10-01 00:49:44 CDT] — [bash_rc.aliases] Added a whole slew of webdev aliases.
    [2020-10-01 00:58:00 CDT] — [bash_rc.aliases] Added some more descriptions.
    [2020-10-01 01:10:26 CDT] — [.gitconfig] Added a whole bunch of my git aliases. tag: v1.0.0
    [2020-10-01 08:17:42 CDT] — [clear-cache] Delete broken symlinks in the ~/.cache directories.

## image-mp3-to-video

Combines an image with an mp3 to create a H264 video.

## launch-browser <browser-path>

1. It detects if the user is running Wayland. If so, for Chromium-based browsers, it will pass 
   the flags necessary for it to run in native-Wayland (not XWayland) for superior performance.
2. It will always launch using the Gnome Keychain, so that you won't lose all of your cookies and
   permanent logins every time you switch to KDE, and vice-versa.

## ls-by-min <MB>

Returns a list of files sorted by file size, descending, that are at least X MB big.

## my-ip

Easily fetch this machine's public IP address.

## obs-global-hotkeys

**obs-global-hotkeys** automates the setup of true global hotkeys for OBS Studio in GNOME 
environments (both Wayland and Xorg), solving the common issue where OBS hotkeys only work 
when the application is focused. It safely installs customizable keybindings by intelligently 
finding available slots in GNOME's media-key configuration without overwriting existing 
user-defined shortcuts. The process is idempotent—meaning repeated installations won't 
duplicate entries—and automatically configures two default hotkeys: **Ctrl+F8** for toggling 
recording and **Ctrl+F9** for pausing/unpausing. Before running, ensure you have `obs-cmd`
(from the `obs-cli` package) installed to enable command-line control of OBS.

To use the script, run `./obs-global-hotkeys.sh install` to add the hotkeys or 
`./obs-global-hotkeys.sh uninstall` to cleanly remove them. The installer dynamically reserves 
unused keybinding slots (e.g., `custom0`, `custom1`), preserving your existing GNOME shortcuts 
while adding OBS functionality. If hotkeys don't activate immediately after installation, 
restart GNOME Shell via Alt+F2 > `r` (Xorg) or log out/in (Wayland). The uninstall command 
precisely removes only the bindings created by this script, leaving other custom keybindings 
untouched. Both operations require `gsettings` and `dconf`, which are standard in GNOME.

## random-file

Picks a random file in a directory / PWD.

## stream-to-youtube

YouTube CLI Livestream Screencaster straight from the CLI (via ffmpeg)!

## sudoers.d/00_prompt_once

This will make `sudo` only ask for your password ONE TIME during
a single boot. It won't ask across terminals and it won't time out.
On reboot, it will automatically expire.

## sync-watch

Displays how many megabytes still need to be written to [slow] disks.

    Every 5.0s: grep -e Dirty: -e Writeback: /proc/meminfo                                                    asus-z13: Fri Jan 19 07:09:32 2024
    
    Dirty:            751552 kB
    Writeback:             0 kB

## turn-off-monitors

Easily turns off all of your monitors via the CLI.

For when you want to just step away and not worry so much about a lock screen.

## turn-off-nvidia

**Comprehensive NVIDIA GPU Power Management Script**

**turn-off-nvidia** is a comprehensive bash script for managing NVIDIA dGPU power states on Linux, standing out as one of the few power management solutions that fully supports **NVIDIA GPUs with AMD CPUs on Wayland** while also working perfectly on Xorg. It prioritizes Runtime D3 Power Management (RTD3) as the modern approach, allowing your discrete GPU to automatically enter deep sleep states (D3cold) when idle, dramatically reducing power consumption and heat on laptops.

The script provides multiple configuration methods including supergfxctl (excellent for ASUS laptops and Wayland), envycontrol, optimus-manager, and legacy options like bbswitch and acpi_call. It features intelligent system detection, comprehensive diagnostics, distro-agnostic package management (pacman/AUR, apt, dnf, zypper), PRIME offload setup for on-demand GPU usage, real-time power monitoring, and safe revert options. With extensive documentation and Wayland-specific guidance, turn-off-nvidia makes it simple to achieve optimal battery life on hybrid graphics laptops.

## watermark.sh

Adds a watermark to videos via ffmpeg.

## wifi-autorun-on-connect.installer

Installs a NetworkManager script that atomatically runs when connected to specific               #
WiFi networks.

## wifi-show-password

Shows the password of the currently connected Wi-Fi AP.

## x265.sh

Transcodes to x265 HEVC via ffmpeg using Intel's graphics card.

# Esoteric Utilities

## esoteric/arch-pacman-dupe-cleaner

Aids in automagically repairing duplicate Pacman database entries in Arch Linux.

It's meant to resolve the rare problem: "error: duplicated database entry 'foo'"

## esoteric/arch-upgrade-postgres

Automates the Arch Linux wiki instructions for upgrading PostgreSQL from one version to the next.

## esoteric/git-shallow-pull

Shallow updates a shallow `git clone --depth 1` repository.

## esoteric/init-btrfs-rootfs

In Arch Linux, a btrfs setup puts every single file in /. This greatly limits
the ability to properly manage the system, with subvol=5 having nothing but
subvolumes.

This script does the following:

* Creates new root-level snapshots: `@rootfs` (/), `@snapshots`, `@important`, and `@home`.
* Moves files `/` into `/@rootfs`, `/home` into `/home` and creates new `/snaps` and `/important`.
* Creates `/media/true-root` that is auto-mounted to `/ (subvol=5)`.
* Integrates with the `cron.d` auto-snapshot cronjobs in this project
   * `/` is snapshotted daily in `/snaps/daily/YYYY-MM-DD.
   * `/important` is snapshotted **hourly** in `/snaps/important/YYYY-MM-DD/HH`.
   * `/important` is set for compression-enabled.
   * Sets up `/home` to quota-enforced based on 10% of the total disk space per-user,
     and 50% of the total disk space for every user.
   * The `/home` snapshot is set for compression-enabled.
   * The `/home` has rolling 7-day snapshotting for user's `.*` files, 
     except for `cache` directories (when using [cron.daily/00_clear-cache]).

### The Problem

Arch Linux sticks all of / in the main BTRFS subvolume (ID=5).

This means that common snapshotting and subvolume tasks,
particularly rolling back to a previously (e.g., working)
root subvolume is exceptionally difficult and requires a
rescue boot, etc.

### The Solution

The provided solution hotfixes the situation, hopefully without
the need for a rescue disk, on a live environment. However,
you really ought to have a rescue disk prepped in avance.

And for the love of God, make backups first!

![btrfs-init-rootfs](https://user-images.githubusercontent.com/1125541/94771567-231f9600-037d-11eb-8032-50d2b5873f36.png)

## esoteric/clone-github-repos.php

Automagically downloads all of the GitHub repositories of a user or or an organization.

## Bash Framework

### is_root

When run standalone, it will echo either "Running as root" or "Not running as root".

When called as a function, it will return either `true` or `false`.

## wait_until_mouse_or_keyboard_event

Blocks the executing program until a key is pressed, the mouse is moved, or a mouse button
is pressed, anywhere, irregardless of window focus.

It will echo one of the following: KEYBOARD_KEY, MOUSE_CLICKED, or MOUSE_MOVED.

Can be run either standalone or as a function.

# License

This project is licensed under the [Creative Commons Attribution License v4.0 International](LICENSE.cc-by.md).

![CC.by License Summary](https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png)

# About The Author

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.
