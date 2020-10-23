＃HopeSeekr的Bash腳本集合

方便您生活的實用工具。

我每天使用的腳本或安裝新系統的腳本，
極大地改善了我的Linux使用體驗！

！[希望的徽標]（https://avatars2.githubusercontent.com/u/50506504?s=200&v=4）

它們按提供給我的實用性（降序）排序。

目錄（分類）
==============================

   * **超級生產力**
      * [bash_rc.aliases]（＃bash_rcaliases）-高辛烷值.bashrc別名和功能可改善生活質量。
      * [sudoers.d / 00_prompt_once]（＃sudoersd00_prompt_once）-每次引導僅提示輸入一次您的sudo密碼。
      * [ssh-keyphrase-only-once]（＃ssh-keyphrase-only-onceinstaller）-每次引導僅提示輸入一次SSH密鑰。
      * [gitconfig]（＃gitconfig）-高辛烷值Git CLI配置。
   * ** CronTabs **
      * [cron.daily / 00_clear-cache]（＃crondaily00_clear-cache）-每晚刪除無用的緩存文件。
      * [cron.daily / 01_purge-locales]（＃crondaily01_purge-locales）-刪除無用的國際語言環境。
      * [cron.hourly / btrfs-snapshot]（＃cronhourlybtrfs-snapshot）-每小時備份一次BTRFS。
      * [cron.daily / btrfs-snapshot]（＃crondailybtrfs-snapshot）-每天備份您的BTRFS。
   * **生活質量**
      * [ls-by-min]（＃ls-by-min-）-按文件大小（降序）對`ls`的輸出進行排序。
      * [隨機文件[dir]]（＃random-file-dir）-隨機選擇一個文件或目錄並顯示它。
      * [sync-watch]（＃sync-watch）-輸出微小的更新顯示，其中需要將多少MB寫入磁盤。
      * [關閉監視器]（＃turn-off-monitors）-通過命令行（CLI）關閉所有監視器。
   * ** Uber Scripts **（很好的控制台腳本）
      * [changelog-maker-lite]（＃changelog-maker-lite）-根據提交歷史記錄快速創建漂亮的變更日誌。
      * [git-mtime]（＃git-mtime）-將每個文件的修改時間恢復到存儲庫的歷史記錄。
      * [stream-to-youtube]（＃stream-to-youtube）-通過CLI直接向YouTube進行實時截屏。
      * [watermark.sh]（＃watermarksh）-輕鬆將自己的圖像水印嵌入視頻中。
      * [wifi-autorun-on-connect]（＃wifi-autorun-on-connectinstaller）-連接到Wifi熱點時自動運行腳本。
      * [x265.sh]（＃x265sh）-使用VAAPI通過Intel顯卡轉碼為h265 HEVC。
   * **神秘的實用工具**
      * [arch-pacman-dupe-cleaner]（＃esotericarch-pacman-dupe-cleaner）-
      * [init-btrfs-rootfs]（＃esotericinit-btrfs-rootfs）-刪除重複的Arch Linux Pacman條目。
      * [clone-github-repos.php]（＃esotericclone-github-reposphp）-下載用戶/ org的所有GitHub存儲庫。
   * [許可證]（＃license）-國際知識共享v4.0
   * [關於作者]（＃about-the-author）

## bash_rc.aliases

可以說這是該項目中最重要的部分！

這幾十個別名使得可以使用Linux並進行開發
網絡應用程序軟件更加高效和簡化。

去看看吧！ [bash_rc.aliases]（bash_rc.aliases）

## sudoers.d / 00_prompt_once

這將使sudo在此過程中僅要求您一次輸入密碼
一次啟動。它不會跨終端詢問，也不會超時。
重新啟動後，它將自動過期。

## ssh-keyphrase-only-once.installer

正確配置您的OpenSSH客戶端，並以這種方式在您的〜/ .bash_profile中安裝`ssh-agent`
您只需為每次與ssh-agent一起使用的操作每次登錄都輸入一次SSH密鑰短語。

## gitconfig

為經驗豐富的軟件開發人員準備的高度優化的.gitconfig，準備提高其日常工作效率。
安裝到〜/ .gitconfig中。

    git漂亮
    吉特

顯示帶有標準ISO日期的精美彩色日誌：

！[git pretty]（https://user-images.githubusercontent.com/1125541/94773688-e904c300-0381-11eb-878a-d0396d2bf102.png）

    git修復

迅速跳入基礎以將最後兩個提交彼此合併。

    git alterego

快速將當前回購切換為使用您的主要alterego帳戶進行先前提交的提交。

    自我

git alterego的相反。

    git resign <哈希>

將批量提交從<hash>快速辭職到最新的。

當您的GPG密鑰過期且需要續簽然後辭職時，此功能特別實用。

    git c：結帳
    git cp：選擇櫻桃
    git cpm：合併提交的Cherry-pick

實用程序別名使git的使用效率更高。

    git顯示

在git log中顯示每次提交的GPG簽名。

## cron.daily / 00_clear-cache

-清空每個非root用戶的〜/ .cache目錄。
-清空Pacman的程序包緩存目錄。

可以選擇使用[nullfsvfs]（https://github.com/abbbi/nullfsvfs）來限制SSD的磨損。

## cron.daily / 01_purge-locales

每天刪除每個非EN語言環境文件。

通常可以節省400-1000 MB的空間。

## cron.hourly / btrfs-snapshot

每小時每小時拍攝一次BTRFS快照。

## cron.daily / btrfs-snapshot

清理前一天的小時快照，同時保留每天的快照。

##關閉顯示器

通過CLI輕鬆關閉所有顯示器。

當您只想離開而不必擔心鎖定屏幕時。

## ls-by-min <MB>

返回按文件大小排序的文件列表，降序至少為X MB。

## x265.sh

使用英特爾的顯卡通過ffmpeg將代碼轉碼為x265 HEVC。

##隨機文件[dir]

從目錄/ PWD中選擇一個隨機文件。

## wifi-autorun-on-connect.installer

安裝一個NetworkManager腳本，該腳本在連接到特定的＃後自動運行
WiFi網絡。

## git-mtime

將每個文件在工作目錄中的修改時間恢復到
最近在遠程git存儲庫中更新。

##同步觀看

顯示仍需要將多少兆字節寫入[慢速]磁盤。

## watermark.sh

通過ffmpeg向視頻添加水印。

## changelog-maker-lite

根據簡明的git commit日誌輕鬆創建[CHANGELOGs]（CHANGELOG.md）：

    [2020-10-01 00:23:15 CDT]-[x265.sh]使用VAAPI通過Intel顯卡進行編碼。
    [2020-10-01 00:30:00 CDT]-創建了README.md。
    [2020-10-01 00:37:07 CDT]-重命名了[random-file]以更加清楚。
    [2020-10-01 00:44:34 CDT]-推出了自述文件。
    [2020-10-01 00:49:44 CDT]-[bash_rc.aliases]添加了一整套webdev別名。
    [2020-10-01 00:58:00 CDT]-[bash_rc.aliases]添加了更多描述。
    [2020-10-01 01:10:26 CDT]-[.gitconfig]添加了一大堆我的git別名。標籤：v1.0.0
    [2020-10-01 08:17:42 CDT]-[清除緩存]刪除〜/ .cache目錄中損壞的符號鏈接。

##流到YouTube

直接來自CLI的YouTube CLI Livestream Screencaster（通過ffmpeg）！

＃神秘的實用程序

##深奧/ arch-pacman-dupe-cleaner

幫助在Arch Linux中自動修復重複的Pacman數據庫條目。

這是為了解決罕見的問題：“錯誤：重複的數據庫條目'foo'”

## esoteric / init-btrfs-rootfs

＃＃＃ 問題

Arch Linux將所有/粘貼在主BTRFS子卷（ID = 5）中。

這意味著常見的快照和子卷任務，
特別是回滾到以前（例如工作）
根子卷異常困難，需要
救援靴等

＃＃＃ 解決方案

提供的解決方案可修復此情況，希望沒有
在實時環境中需要應急磁盤。然而，
您真的應該事先準備好救援盤。

為了上帝的愛，請先備份！

！[btrfs-init-rootfs]（https://user-images.githubusercontent.com/1125541/94771567-231f9600-037d-11eb-8032-50d2b5873f36.png）

## esoteric / clone-github-repos.php

自動下載用戶或組織的所有GitHub存儲庫。

＃ 執照

該項目已獲得[知識共享署名許可國際v4.0]（LICENSE.cc-by.md）的許可。

！[CC.by許可摘要]（https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png）

＃ 關於作者

[西奧多·史密斯]（https://www.phpexperts.pro/]）<theodore@phpexperts.pro>
GPG指紋：4BF8 2613 1C34 87AC D28F 2AD8 EB24 A91D D612 5690
首席執行官：PHP Experts，Inc.
