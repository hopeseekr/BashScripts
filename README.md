# HopeSeekr's Bash Scripts

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

They are sorted by how much utility they provide me, descending.

## bash_rc.aliases

This is arguably the most important piece of the project!

These dozens of aliases make working with Linux and developing
web app software much more efficient and streamlined.

Go check it out! [bash_rc.aliases](bash_rc.aliases)

## sudoers.d/00_prompt_once

This will make `sudo` only ask for your password ONE TIME during
a single boot. It won't ask across terminals and it won't time out.
On reboot, it will automatically expire.

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

## turn-off-monitors

Easily turns off all of your monitors via the CLI.

For when you want to just step away and not worry so much about a lock screen.

## ls-by-min <MB>

Returns a list of files sorted by file size, descending, that are at least X MB big.

## x265.sh

Transcodes to x265 HEVC via ffmpeg using Intel's graphics card.

## random-file [dir]

Picks a random file in a directory / PWD.

## git-mtime

Restores each file's modification time in your working directory to when it was 
last updated in the remote git repository.

## sync-watch

Displays how many megabytes still need to be written to [slow] disks.

## watermark.sh

Adds a watermark to videos via ffmpeg.

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

# Esoteric Utilities

## esoteric/arch-pacman-dupe-cleaner

Aids in automagically repairing duplicate Pacman database entries in Arch Linux.

It's meant to resolve the rare problem: "error: duplicated database entry 'foo'"

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
