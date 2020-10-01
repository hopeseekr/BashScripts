# HopeSeekr's Bash Scripts

Utilities to ease your life.

Scripts that I use on a daily basis, or on new system installs,
that improve my experience with Linux substantially!

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
