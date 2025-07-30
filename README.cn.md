# HopeSeekr 的 Bash 脚本集

用于简化生活的实用工具。

这是我日常使用的脚本，或在新的系统安装中使用的脚本，大大改善了我使用 Linux 的体验！

![Hope 的标志](https://avatars2.githubusercontent.com/u/50506504?s=200&v=4)

它们根据对我提供的效用进行排序。

目录（分类）
====================

* **超级生产力**
    * [bash_profile](#bash_profile) — 针对高级用户的高质量 `.bash_profile` 和 `.bashrc`。
    * [bash_rc.aliases](#bash_rcaliases) — 高效的 .bashrc 别名和函数，用于提升生活质量。
    * [bash-timer](#bash-timer) — 在bash中轻松为每个命令添加人类可读的执行时间！
    * [ssh-autologin](#ssh-autologin) — 自动设置 SSH 自动登录。
    * [ssh-keyphrase-only-once](#ssh-keyphrase-only-onceinstaller) — 每次启动时仅请求一次 SSH 密码短语。
    * [gitconfig](#gitconfig) — 高效的 Git CLI 配置。
* **Git 生活质量**
    * [git-change-author](#git-change-author) — 轻松批量更改 git 仓库中的作者姓名和电子邮件。
    * [git-commit-at-modded-time](#git-commit-at-modded-time) — 使用文件修改时间作为 git 提交时间。
    * [git-mtime](#git-mtime-git-modified-time-restorer) — 将每个文件的修改时间恢复到 git 仓库历史记录中。
    * [git-same-sig-time](#git-same-sig-time) — 统一 GPG 签名时间与提交时间。
    * [git-shallow-pull](#esotericgit-shallow-pull) — 浅层更新 `git clone --depth 1` 的仓库。
* **CronTabs**
    * [cron.daily/00_clear-cache](#crondaily00_clear-cache) — 每晚清除无用的缓存文件。
    * [cron.daily/01_purge-locales](#crondaily01_purge-locales) — 删除无用的国际化文件。
    * [cron.hourly/btrfs-snapshot](#cronhourlybtrfs-snapshot) — 每小时备份你的 BTRFS / 。
    * [cron.daily/btrfs-snapshot](#crondailybtrfs-snapshot) — 每天备份你的 BTRFS / 。
    * [cron.hourly/php-clean-tmp](#cronhourlyphp-clean-tmp) — 在繁忙的服务器上清理 PHP 临时文件。
* **生活质量**
    * [launch-browser](#launch-browser) — 用于启动浏览器的实用脚本，可在完整的 Wayland 模式下启动它们。
    * [ls-by-min](#ls-by-min) — 按文件大小降序排序 `ls` 输出。
    * [my-ip](#my-ip) — 轻松获取该机器的公共IP地址。
    * [random-file](#random-file) — 随机选择并显示一个文件或目录。
    * [sync-watch](#sync-watch) — 显示需要写入磁盘的 MB 数量的更新屏幕。
    * [tar-sorted](#tar-sorted) — 自动按文件名排序创建 tar 文件。
    * [turn-off-monitors](#turn-off-monitors) — 通过命令行关闭所有显示器（CLI）。
    * [wifi-show-password](#wifi-show-password) — 显示当前连接的wifi密码。
* **精彩脚本**
    * [american-date](#american-date) — 一个用于打印美国日期格式的工具。
    * [changelog-maker-lite](#changelog-maker-lite) — 根据提交历史快速创建美观的变更日志。
    * [stream-to-youtube](#stream-to-youtube) — 直接从命令行直播到 YouTube。
    * [sudoers.d/00_prompt_once](#sudoersd00_prompt_once) — 每次启动时仅请求一次 sudo 密码。
    * [watermark.sh](#watermarksh) — 轻松在视频中嵌入自定义水印。
    * [wifi-autorun-on-connect](#wifi-autorun-on-connectinstaller) — 连接到 WiFi 热点时自动运行脚本。
    * [x265.sh](#x265sh) — 使用 Intel 显卡通过 VAAPI 转码到 h265 HEVC。
* **神秘工具**
    * [arch-pacman-dupe-cleaner](#esotericarch-pacman-dupe-cleaner) — 清除 Arch Linux Pacman 中的重复条目。
    * [arch-upgrade-postgres](#esotericarch-upgrade-postgres) — 在 Arch Linux 中自动将 PostgreSQL 从一个版本升级到下一个版本。
    * [init-btrfs-rootfs](#esotericinit-btrfs-rootfs) — 将所有内容放入组织良好的 BTRFS 子卷，并启用快照。
    * [clone-github-repos.php](#esotericclone-github-reposphp) — 下载用户/组织的所有 GitHub 仓库。
* **Bash 框架**
    * [is_root](#is_root) — 提供 `is_root` 函数以确定当前用户是否具有 root 访问权限。
    * [wait_until_mouse_or_keyboard_event](#wait_until_mouse_or_keyboard_event) — 阻止程序执行，直到按下键盘键、移动鼠标或单击鼠标按钮。

* [许可证](#license) — 创作共用 v4.0 国际许可证
* [关于作者](#about-the-author)

## bash_profile

将许多 Bash 脚本结合在一起，创建一个超级强大的系统。

## bash_rc.aliases

这可能是项目中最有价值的一部分！

这些数十个别名使在 Linux 上工作和开发 Web 应用程序更加高效和优化。

快去查看文件！ [bash_rc.aliases](bash_rc.aliases)

## bash-timer

在bash中轻松为每个命令添加人类可读的执行时间！

时间将显示在左下角，紧靠您的$PS1左侧。

![bash-timer image](https://user-images.githubusercontent.com/1125541/93687425-7c392100-fa83-11ea-9d36-cacbe03cc725.png)
```
2 days 05:02:11.33 # A very long process
```

**安装方法：**

```bash
curl https://raw.githubusercontent.com/hopeseekr/bash-timer/v1.5.0/install | bash
```

[**查看README.md**](bash-timer/README.md)了解更多信息。

## ssh-autologin

自动设置（如果需要）SSH 私钥并将其安装在远程服务器上（如果需要，还将创建 .ssh 目录）。

## ssh-keyphrase-only-once.installer

正确配置你的 OpenSSH 客户端并在 `~/.bash_profile` 中安装 `ssh-agent`，这样你只需在每次登录时为任何使用 `ssh-agent` 的操作输入一次 SSH 密码短语。

## gitconfig

一个高度优化的 .gitconfig 文件，适用于经验丰富的软件开发人员，以提高他们的日常生产力。

安装在 ~/.gitconfig 中。

    git pretty
    git ll

显示一个带有标准 ISO 日期的漂亮多彩日志：

![git pretty](https://user-images.githubusercontent.com/1125541/94773688-e904c300-0381-11eb-878a-d0396d2bf102.png)

    git fix

快速跳转以将最近的两个提交合并为一个提交。

    git alterego

快速切换当前仓库以使用你的主 AlterEgo 账户提交先前的更改。

    git ego

git alterego 的反义词。

    git resign <hash>

快速批量重新签署从指定 hash 到最近的提交。

这在 GPG 密钥到期并需要更新然后重新签署时特别有用。

    git c: checkout
    git cp: cherry-pick
    git cpm: cherry-pick for Merge commits

实用的别名，使使用 git 更加高效。

    git shows

在 git 日志中显示每个提交的 GPG 签名。

## git-change-author

轻松批量更改 git 仓库中任意提交的作者姓名和电子邮件。

使用方法: `git-change-author "你的名字" "email@地址" [SHA1]`

## git-commit-at-modded-time

使用文件修改时间作为 git 提交时间。

示例:

    $ ls -l american-date
     #-rwxrwxr-x+ 1 1MB Oct 14  2020  american-date
    $ ./git-commit-at-modded-time american-date
    $ git pretty american-date
    7462b66 G 2020-10-14 15:53:34 -0500 Theodore R. Smith

## git-mtime Git 修改时间恢复器

将工作目录中每

个文件的修改时间恢复到它们在 git 仓库历史记录中的时间。

当你签出一个仓库并执行此操作时，你的工作目录将从：

    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 CHANGELOG.txt
    -rw-rw-r--+ 1 tsmith users 1MB Oct 22 01:58 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Oct 22 01:58 git-mtime

变为：

    -rwxrwxr-x+ 1 tsmith users 1MB Oct  1 08:38 changelog-maker-lite*
    -rw-rw-r--+ 1 tsmith users 1MB Oct  1 01:10 gitconfig
    -rwxrwxr-x+ 1 tsmith users 1MB Sep 30 23:19 git-mtime

## git-same-sig-time

统一 GPG 签名时间与提交时间。

之前：

     gpg: Signature made Fri 19 Jan 2024 06:50:44 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     43578ec G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Fri 19 Jan 2024 06:50:25 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     8ab4104 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

之后：

     gpg: Signature made Tue 16 Jan 2024 01:52:41 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     515e36b G 2024-01-16 01:52:41 -0600 Theodore R. Smith   [m] Updated the packages and exclusion lists. HEAD
     gpg: Signature made Mon 15 Jan 2024 08:27:07 AM CST
     gpg:                using RSA key 4BF826131C3487ACD28F2AD8EB24A91DD6125690
     gpg: Good signature from "Theodore R. Smith <theodore@phpexperts.pro>" [ultimate]
     22c5040 G 2024-01-15 08:27:07 -0600 Theodore R. Smith   Upgraded to PHP 8.3.

## tar-sorted
 
自动按文件名排序创建 tar 文件。

这在随机排序的文件系统（如 ext4）中特别有用。

在 Bettergist Collector 中，我们使用此方法来大致估算压缩和提取多个 GB 包含数百万文件的档案所需的时间。

这是 `tar` 的直接替代，并使用相同的参数。

可选地，你可以将函数直接安装在你的 ~/.bashrc 中。

## cron.daily/00_clear-cache

- 清空非 root 用户的 ~/.cache 目录。
- 清空 Pacman 的包缓存目录。

此操作可以选择性地使用 [nullfsvfs](https://github.com/abbbi/nullfsvfs) 来限制 SSD 的磨损。

## cron.daily/01_purge-locales

每天删除所有非 EN 的国际化文件。

通常可以节省 400 至 1000 MB 的空间。

## cron.hourly/btrfs-snapshot

每小时整点拍摄 BTRFS 的 / 快照。

## cron.daily/btrfs-snapshot  

清理前一天的每小时快照，同时保留每日快照。

## cron.hourly/php-clean-tmp

清理无用的 PHP 临时文件，这在繁忙的服务器上非常有用。
* 最近一小时内未修改的旧会话文件。
* phpunit 的临时文件。
* phpstan 的临时文件。

## american-date

用于打印美国格式日期的工具

    周五, 2024 年 1 月 19 日 05:49:20 CST

## changelog-maker-lite

轻松根据简洁的 git 提交记录创建 [CHANGELOG](CHANGELOG.md)：

    [2020-10-01 00:23:15 CDT] — [x265.sh] 使用 Intel 显卡的 VAAPI 进行编码。
    [2020-10-01 00:30:00 CDT] — 创建了 README.md。
    [2020-10-01 00:37:07 CDT] — [random-file] 为了更清晰的重命名。
    [2020-10-01 00:44:34 CDT] — 充实了 README。
    [2020-10-01 00:49:44 CDT] — [bash_rc.aliases] 添加了一系列 Web 开发别名。
    [2020-10-01 00:58:00 CDT] — [bash_rc.aliases] 添加了更多描述。
    [2020-10-01 01:10:26 CDT] — [.gitconfig] 添加了大量 git 别名。 标签: v1.0.0
    [2020-10-01 08:17:42 CDT] — [clear-cache] 删除 ~/.cache 目录中的损坏符号链接。

## launch-browser <browser-path>

1. 检测用户是否在运行 Wayland。 如果是这样，对于基于 Chromium 的浏览器，它将传递必要的标志，以便在 Wayland 原生模式（非 XWayland）下运行，以获得更高的性能。
2. 它将始终使用 Gnome 密钥环启动，这样每次切换到 KDE 时，你不会丢失所有 cookie 和持久登录信息，反之亦然。

## ls-by-min <MB>

返回按文件大小降序排列的文件列表，文件大小至少为 X MB。

## my-ip

轻松获取该机器的公共IP地址。

## random-file

在当前目录或工作目录中随机选择一个文件。

## stream-to-youtube

直接从命令行通过 YouTube 直播屏幕（通过 ffmpeg）！

## sudoers.d/00_prompt_once

这将使 `sudo` 在一次启动过程中仅要求输入一次密码。 它不会通过不同的终端请求，并且不会过期。 重启后会自动过期。

## sync-watch

显示仍需写入磁盘的 MB 数量。

    每 5.0s: grep -e Dirty: -e Writeback: /proc/meminfo                                                    
    asus-z13: 周五 2024 年 1 月 19 日 07:09:32
    
    Dirty:            751552 kB
    Writeback:             0 kB

## turn-off-monitors

通过命令行轻松关闭所有显示器。

当你想要离开并不那么担心锁屏时使用。

## watermark.sh

通过 ffmpeg 为视频添加水印。

## wifi-autorun-on-connect.installer

安装一个 NetworkManager 脚本，在连接到特定 WiFi 网络时自动运行。

## wifi-show-password

显示当前连接的wifi密码。

## x265.sh

通过使用 Intel 显卡的 ffmpeg 转码到 x265 HEVC。

# 神秘工具

## esoteric/arch-pacman-dupe-cleaner

帮助自动修复 Arch Linux Pacman 数据库中的重复条目。

旨在解决罕见问题：“错误：重复的数据库条目‘foo’”

## esoteric/arch-upgrade-postgres

自动执行 Arch Linux wiki 指令以将 PostgreSQL 从一个版本升级到另一个版本。

## esoteric/git-shallow-pull

浅层更新 `git clone --depth 1` 的仓库。

## esoteric/init-btrfs-rootfs

在 Arch Linux 上，btrfs 配置将所有文件放在 / 上。 这极大地限制了适当管理系统的能力，subvol=5 除了子卷以外什么也没有。

这个脚本做以下事情：

* 创建新的根级别快照：`@rootfs` (/), `@snapshots`, `@important` 和 `@home`。
* 将 `/` 的文件移动到 `/@rootfs`，将 `/home` 的文件移动到 `/home`，并创建新的目录 `/snaps` 和 `/important`。
* 创建 `/media/true-root`，它会自动挂载到 `/ (subvol=5)`。
* 与此项目中的自动快照 `cron.d` 作业集成
   * 每天在 `/snaps/daily/YYYY-MM-DD` 中对 `/` 进行快照。
   * **每小时**在 `/snaps/important/YYYY-MM-DD/HH` 中对 `/important` 进行快照。
   * `/important` 配置为启用压缩。
   * 将 `/home` 配置为基于每个用户的磁盘总空间的 10% 应用配额，并为每个用户的磁盘总空间应用 50% 的配额。
   * `/home` 快照配置为启用
   * `/home` 为用户的 `.*` 文件启用了 7 天的循环快照，除非是 `缓存` 目录（使用 [cron.daily/00_clear-cache] 时）。
   
### 问题

Arch Linux 将 / 的所有内容放在 BTRFS 的主子卷中 (ID=5)。

这意味着常见的快照和子卷创建任务，特别是回滚到以前的根子卷（例如功能性），非常困难，并且需要启动救援等。

### 解决方案

提供的解决方案暂时解决了这一情况，幸运的是，在无需救援光盘的情况下，在实时环境中完成。 然而，你确实应该事先准备好救援光盘。

为了神的爱，首先备份！
![btrfs-init-rootfs](https://user-images.githubusercontent.com/1125541/94771567-231f9600-037d-11eb-8032-50d2b5873f36.png)

## esoteric/clone-github-repos.php

自动下载用户或组织的所有 GitHub 仓库。

## Bash 框架

### is_root

独立运行时，它将回显“以 root 身份运行”或“未以 root 身份运行”。

作为函数调用时，它将返回 `true` 或 `false`。

## wait_until_mouse_or_keyboard_event

阻止正在执行的程序，直到按下键盘键、移动鼠标或按下鼠标按钮，无论窗口焦点如何。

它将回显以下内容之一：KEYBOARD_KEY、MOUSE_CLICKED 或 MOUSE_MOVED。

可以独立运行或作为函数运行。

# 许可证

本项目采用 [Creative Commons Attribution License v4.0 International](LICENSE.cc-by.md) 进行许可。

![CC.by 许可证摘要](https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png)

# 关于作者

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG 指纹：4BF8 2613 1C34 87AC D28F 2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.
