# HopeSeekr's Bash Scripts Collection

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

![Hope's Logo](https://avatars2.githubusercontent.com/u/50506504?s=200&v=4)

They are sorted by how much utility they provide me, descending.

Translations: [中文](README.cn.md), [हिन्दी](README.hi.md)

Recent Changes
==============

## v2.5.0 @ 2024-01-19
* **[2020-10-14]** [american-date] A utility to print out dates in the American format ('Fri, 19 January 2024 05:49:20 CST').
* **[2024-01-15]** [tar-sorted] Create tar files automatically sorted by file name.
* **[2023-11-17]** [git-commit-at-modded-time] Use a file's modified time as the git time.
* **[2024-01-19]** [git-same-sig-time] Unifies the GPG signature time with the commit's time.

#### v2.4.1 @ 2024-01-14
* **[2024-01-14]** [arch-pacman-dupe-cleaner] Fixed the script for modern Arch.

#### v2.4.0 @ 2024-01-13
* **[2024-01-13]** Added a Bash alias to have `free` show the total memory in MiBs.
* **[2024-01-13]** Added a Bash alias `ps-date` to show the full date timestamp of a long-running process.
* **[2024-01-13]** Added a Bash alias to hide all of the snap /dev/loop devices from df.
* **[2024-01-13]** [changelog-maker-lite] Bold the timestamps. HEAD -> trunk


Table of Contents (Categorized)
===============================

   * **Super Productivity**
      * [bash_rc.aliases](#bash_rcaliases) - High-Octane .bashrc aliase and functions for a better Quality of Life.
      * [sudoers.d/00_prompt_once](#sudoersd00_prompt_once) - Only prompt for your sudo password once per boot.
      * [ssh-autologin](#ssh-autologin) - Automatically set up SSH autologins.
      * [ssh-keyphrase-only-once](#ssh-keyphrase-only-onceinstaller) - Only prompt for your SSH keyphrase once per boot.
      * [gitconfig](#gitconfig) - High-Octane Git CLI Configuration.
   * **Git Quality of Life**
     * [git-change-author](#git-change-author) - Easily bulk change the author's name and email in a git repo.
     * [git-commit-at-modded-time](#git-commit-at-modded-time) - Use a file's modified time as the git time.
     * [git-mtime](#git-mtime-git-modified-time-restorer) - Restores every file's modification time to that of the repo's history.
     * [git-same-sig-time](#git-same-sig-time) - Unifies the GPG signature time with the commit's time.
     * [git-shallow-pull](#esotericgit-shallow-pull) - Shallow updates a shallow `git clone --depth 1` repository.
   * **CronTabs**
      * [cron.daily/00_clear-cache](#crondaily00_clear-cache) - Remove useless cache files nightly.
      * [cron.daily/01_purge-locales](#crondaily01_purge-locales) - Remove worthless intl locales.
      * [cron.hourly/btrfs-snapshot](#cronhourlybtrfs-snapshot) - Backup your BTRFS / hourly.
      * [cron.daily/btrfs-snapshot](#crondailybtrfs-snapshot) - Backup your BTRFS  / daily.
   * **Quality of Life**
      * [ls-by-min ](#ls-by-min-) - Sorts the output of  `ls` by file size, descending.
      * [random-file [dir]](#random-file-dir) -  Randomly picks a file or directory and displays it.
      * [sync-watch](#sync-watch) - Outputs a tiny, updating display of how many MBs need to be written to disks.
      * [tar-sorted](#tar-sorted) - Create tar files automatically sorted by file name.
      * [turn-off-monitors](#turn-off-monitors) - Turns off all monitors via the Command Line (CLI). 
   * **Uber Scripts** (很好的控制台脚本)
      * [american-date](#american-date) - A utility to print out dates in the American format.
      * [changelog-maker-lite](#changelog-maker-lite) - Quickly creates a beautiful changelog from the commit history.
      * [stream-to-youtube](#stream-to-youtube) - Live Screencast directly to YouTube from the CLI. 
      * [watermark.sh](#watermarksh) - Easily embed your own image watermark onto videos.
      * [wifi-autorun-on-connect](#wifi-autorun-on-connectinstaller) - Autorun a script when you connect to a Wifi hotspot.
      * [x265.sh](#x265sh) - Transcode to h265 HEVC via the Intel graphics card using VAAPI.
   * **Esoteric Utilities**
      * [arch-pacman-dupe-cleaner](#esotericarch-pacman-dupe-cleaner) - 
      * [init-btrfs-rootfs](#esotericinit-btrfs-rootfs) - Remove duplicated Arch Linux Pacman entries.
      * [clone-github-repos.php](#esotericclone-github-reposphp) - Downloads all of a user's/org's GitHub repositories.
   * [License](#license) - Creative Commons v4.0 International
   * [About The Author](#about-the-author)

## bash_rc.aliases

This is arguably the most important piece of the project!

These dozens of aliases make working with Linux and developing
web app software much more efficient and streamlined.

Go check it out! [bash_rc.aliases](bash_rc.aliases)

## sudoers.d/00_prompt_once

This will make `sudo` only ask for your password ONE TIME during
a single boot. It won't ask across terminals and it won't time out.
On reboot, it will automatically expire.

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

## american-date

A utility to print out dates in the American format

    Fri, 19 January 2024 05:49:20 CST

## changelog-maker-lite

Easily creates [CHANGELOGs](CHANGELOG.md) based upon concise git commit logs:

    [2020-10-01 00:23:15 CDT] - [x265.sh] Use VAAPI for encoding using Intel graphics cards.
    [2020-10-01 00:30:00 CDT] - Created a README.md.
    [2020-10-01 00:37:07 CDT] - [random-file] renamed for more clarity.
    [2020-10-01 00:44:34 CDT] - Flushed out the README.
    [2020-10-01 00:49:44 CDT] - [bash_rc.aliases] Added a whole slew of webdev aliases.
    [2020-10-01 00:58:00 CDT] - [bash_rc.aliases] Added some more descriptions.
    [2020-10-01 01:10:26 CDT] - [.gitconfig] Added a whole bunch of my git aliases. tag: v1.0.0
    [2020-10-01 08:17:42 CDT] - [clear-cache] Delete broken symlinks in the ~/.cache directories.

## ls-by-min <MB>

Returns a list of files sorted by file size, descending, that are at least X MB big.

## random-file [dir]

Picks a random file in a directory / PWD.

## stream-to-youtube

YouTube CLI Livestream Screencaster straight from the CLI (via ffmpeg)!

## sync-watch

Displays how many megabytes still need to be written to [slow] disks.

    Every 5.0s: grep -e Dirty: -e Writeback: /proc/meminfo                                                    asus-z13: Fri Jan 19 07:09:32 2024
    
    Dirty:            751552 kB
    Writeback:             0 kB

## turn-off-monitors

Easily turns off all of your monitors via the CLI.

For when you want to just step away and not worry so much about a lock screen.

## wifi-autorun-on-connect.installer

Installs a NetworkManager script that atomatically runs when connected to specific               #
WiFi networks.

## watermark.sh

Adds a watermark to videos via ffmpeg.

## x265.sh

Transcodes to x265 HEVC via ffmpeg using Intel's graphics card.

# Esoteric Utilities

## esoteric/arch-pacman-dupe-cleaner

Aids in automagically repairing duplicate Pacman database entries in Arch Linux.

It's meant to resolve the rare problem: "error: duplicated database entry 'foo'"

## esoteric/git-shallow-pull

Shallow updates a shallow `git clone --depth 1` repository.

## esoteric/init-btrfs-rootfs

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

# License

This project is licensed under the [Creative Commons Attribution License v4.0 International](LICENSE.cc-by.md).

![CC.by License Summary](https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png)

# About The Author

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.
