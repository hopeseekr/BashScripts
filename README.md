# HopeSeekr's Bash Scripts Collection

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

![Hope's Logo](https://avatars2.githubusercontent.com/u/50506504?s=200&v=4)

They are sorted by how much utility they provide me.

Translations: [中文](README.cn.md), [हिन्दी](README.hi.md)

Recent Changes
==============
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

#### v2.6.1 @ 2024-08-23

* **[2024-08-23 07:09:10 CDT]** [git-same-sig-time] Added proper support for time zones different than the user's computer.

#### v2.6.0 @ 2024-08-12

* **[2024-08-12]** Majorly cleaned up the README and translated to Chinese, Hindi, and Spanissh.
* **[2024-08-12]** [turn-off-monitors] Added full support for turning off monitors in Wayland for Gnome and KDE.
* **[2024-08-12]** [arch-pacman-dupe-cleaner] Require superuser to run.
* **[2024-08-12]** [gitconfig] Automatically time out git when websites are not reachable.
* **[2024-08-12]** [bash_rc.aliases] Replace ssh with mosh, if it is installed.
* **[2024-08-12]** [bash_rc.aliases] Added an alias to make `watch` honor ~/.bashrc aliases.
* **[2024-08-12]** [framework/wait_until_mouse_or_keyboard_event] Block execution until a key is pressed, 
                   the mouse is moved, or a mouse button is clicked.
* **[2024-08-12]** [framework/is_root] Added a function for determining root access.
* **[2024-08-12]** [launch-browser] Launch Chrome-based browsers in native Wayland.
* **[2024-08-12]** Added a .bash_profile.


Table of Contents (Categorized)
===============================

* **Super Productivity**
    * [bash_profile](#bash_profile) — High-quality `.bash_profile` and `.bashrc` for power users.
    * [bash_rc.aliases](#bash_rcaliases) — High-Octane .bashrc aliase and functions for a better Quality of Life.
    * [bash-timer](#bash-timer) — Easily add Human-readable execution time for every command in bash!
    * [ssh-autologin](#ssh-autologin) — Automatically set up SSH autologins.
    * [ssh-keyphrase-only-once](#ssh-keyphrase-only-onceinstaller) — Only prompt for your SSH keyphrase once per boot.
    * [gitconfig](#gitconfig) — High-Octane Git CLI Configuration.
* **Git Quality of Life**
    * [git-change-author](#git-change-author) — Easily bulk change the author's name and email in a git repo.
    * [git-commit-at-modded-time](#git-commit-at-modded-time) — Use a file's modified time as the git time.
    * [git-mtime](#git-mtime-git-modified-time-restorer) — Restores every file's modification time to that of the repo's history.
    * [git-same-sig-time](#git-same-sig-time) — Unifies the GPG signature time with the commit's time.
    * [git-shallow-pull](#esotericgit-shallow-pull) — Shallow updates a shallow `git clone --depth 1` repository.
* **CronTabs**
    * [cron.daily/00_clear-cache](#crondaily00_clear-cache) — Remove useless cache files nightly.
    * [cron.daily/01_purge-locales](#crondaily01_purge-locales) — Remove worthless intl locales.
    * [cron.hourly/btrfs-snapshot](#cronhourlybtrfs-snapshot) — Backup your BTRFS / hourly.
    * [cron.daily/btrfs-snapshot](#crondailybtrfs-snapshot) — Backup your BTRFS  / daily.
    * [cron.hourly/php-clean-tmp](#cronhourlyphp-clean-tmp) — Cleans PHP temp files on busy servers.
* **Quality of Life**
    * [launch-browser](#launch-browser) — Browser launcher utility script that launches browsers in full-Wayland.
    * [ls-by-min](#ls-by-min) — Sorts the output of  `ls` by file size, descending.
    * [random-file](#random-file) — Randomly picks a file or directory and displays it.
    * [sudoers.d/00_prompt_once](#sudoersd00_prompt_once) — Only prompt for your sudo password once per boot.
    * [sync-watch](#sync-watch) — Outputs a tiny, updating display of how many MBs need to be written to disks.
    * [tar-sorted](#tar-sorted) — Create tar files automatically sorted by file name.
    * [turn-off-monitors](#turn-off-monitors) — Turns off all monitors via the Command Line (CLI).
    * [wifi-show-password](#wifi-show-password) — Shows the currently connected wifi password.
* **Uber Scripts** (很好的控制台脚本)
    * [american-date](#american-date) — A utility to print out dates in the American format.
    * [changelog-maker-lite](#changelog-maker-lite) — Quickly creates a beautiful changelog from the commit history.
    * [stream-to-youtube](#stream-to-youtube) — Live Screencast directly to YouTube from the CLI. 
    * [watermark.sh](#watermarksh) — Easily embed your own image watermark onto videos.
    * [wifi-autorun-on-connect](#wifi-autorun-on-connectinstaller) — Autorun a script when you connect to a Wifi hotspot.
    * [x265.sh](#x265sh) — Transcode to h265 HEVC via the Intel graphics card using VAAPI.
* **Esoteric Utilities**
    * [arch-pacman-dupe-cleaner](#esotericarch-pacman-dupe-cleaner) — Remove duplicated Arch Linux Pacman entries.
    * [arch-upgrade-postgres](#esotericarch-upgrade-postgres) — Automates the upgrading PostgreSQL from one version to the next in Arch Linux.
    * [init-btrfs-rootfs](#esotericinit-btrfs-rootfs) — Puts everything into organized BTRFS subvolumes + turns on snapshotting.
    * [clone-github-repos.php](#esotericclone-github-reposphp) — Downloads all of a user's/org's GitHub repositories.
* **Bash Framework**
    * [is_root](#is_root) — Provides the `is_root` function for determining if the current user has root access.
    * [wait_until_mouse_or_keyboard_event](#wait_until_mouse_or_keyboard_event) — Block execution until a key is pressed, the mouse is moved, or a mouse button is clicked.

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

## launch-browser <browser-path>

1. It detects if the user is running Wayland. If so, for Chromium-based browsers, it will pass 
   the flags necessary for it to run in native-Wayland (not XWayland) for superior performance.
2. It will always launch using the Gnome Keychain, so that you won't lose all of your cookies and
   permanent logins every time you switch to KDE, and vice-versa.

## ls-by-min <MB>

Returns a list of files sorted by file size, descending, that are at least X MB big.

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
