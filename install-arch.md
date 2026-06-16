# ArchLinux dotfiles

## BIOS
- `archinstall`
    - 日本のミラーサーバーを指定
    - パーティションはext4
    - niri, sddm を選択

## Install

### bootloader

1. `paru -S --noconfirm plymouth-theme-mikuboot-git plymouth update-grub`
2. `sudo vim /etc/mkinitcpio.conf`
3. HOOKS の最後に plymouth を追加
  - `HOOKS=(base ... plymouth)`
4. `sudo mkinitcpio -P`
5. `sudo plymouth-set-default-theme -R mikuboot`
6. `sudo vim /etc/default/grub`
7. 以下を追加
  - `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash udev.log-priority=3"`
8. `sudo update-grub`
9. 再起動

### SDDM theme

- [Refer to the Document](https://github.com/ysktl/simple_sddm_2_roman)

