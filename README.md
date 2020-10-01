# HopeSeekr's Bash Scripts

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

## bash_rc.aliases

This is arguably the most important piece of the project!

These dozens of aliases make working with Linux and developing
web app software much more efficient and streamlined.

Go check it out! [bash_rc.aliases](bash_rc.aliases)

## sudoers.d/00_prompt_once

This will make `sudo` only ask for your password ONE TIME during
a single boot. It won't ask across terminals and it won't time out.
On reboot, it will automatically expire.

## cron.daily/00_clear-cache

- Empties out the ~/.cache directory of every non-root user.
- Empties out Pacman's package cache directory.

This requires [nullfsvfs](https://github.com/abbbi/nullfsvfs) and requires that
it be mounted to /media/sinkhole.

## cron.daily/01_purge-locales

Removes every non-EN locale file every day.

This saves, usually, 400-1000 MB of space.

## cron.hourly/btrfs-snapshot

Takes BTRFS snapshots of / every hour on the hour.

## cron.daily/btrfs-snapshot

Cleans up the prior day's hourly snapshots while keeping the daily ones.

## clone-github-repos.php

Automagically downloads all of the GitHub repositories of a user or or an organization.

## init-btrfs-rootfs

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

## ls-by-min <MB>

Returns a list of files sorted by file size, descending, that are at least X MB big.

## random-file [dir]

Picks a random file in a directory / PWD.

## sync-watch

Displays how many megabytes still need to be written to [slow] disks.

## watermark.sh

Adds a watermark to videos via ffmpeg.

## x265.sh

Transcodes to x265 HEVC via ffmpeg using Intel's graphics card.
