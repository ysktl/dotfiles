# ArchLinux dotfiles

## BIOS
- `archinstall`
    - 日本のミラーサーバーを指定
    - パーティションはext4
    - niri, sddm を選択

## Install

### paru

1. `sudo pacman -S git vim github-cli`

2. `sudo pacman -S --needed base-devel`
3. `git clone https://aur.archlinux.org/paru.git`
4. `cd paru && makepkg -si`
5. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ysktl`

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

### packages

1. `paru -S --noconfirm neovim noctalia-shell zsh rustup ghostty zed helium-browser-bin zellij-git yazi lazygit fcitx5-im fcitx5-mozc noto-fonts-cjk wl-clipboard`
2. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
3. `curl -sS https://starship.rs/install.sh | sh`
4. `chsh -s $(which zsh)`
5. `rustup default nightly`
6. `curl https://mise.run | sh`
7. `mise use -g node npm bun deno uv pkl`
8. `sudo echo "ja_JP.UTF-8 UTF-8" | sudo tee /etc/locale.gen`
9. `sudo locale-gen`
10. `fc-cache -fv`
11. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`

