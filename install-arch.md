# My dotfiles for ArchLinux on VM

## Rule

- Google, MSなどのパーソナルアカウント連携,シークレット情報保存,使用を禁止
  - Github のみ許可

## Setup bedore install

### BIOS
- `archinstall`
    - 日本のミラーサーバーを指定
    - パーティションはなんでもいい(ext4)
    - niri, sddm を選択

### Install Required Libraries

git, vim, neovim 導入

```bash
sudo pacman -S git vim neovim
```

paru 導入

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Setting Boot Loader

`paru -S **plymouth-theme-mikuboot-git**`

`paru -S plymouth`

`sudo vim /etc/mkinitcpio.conf`

HOOKS の最後に `plymouth` を追加

```text
HOOKS=(base ... plymouth)
```

`sudo mkinitcpio -P`

`paru -S update-grub`

`sudo plymouth-set-default-theme -R mikuboot`

`sudo vim /etc/default/grub`

以下を追加

```text
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash udev.log-priority=3"
```

`sudo update-grub`

`reboot`

## Install

0. `rm -rf ~/.config`
1. `git clone https://github.com/ysktl/.dotfiles.arch.git ~/.dotfiles.arch`
2. `cd ~/.dotfiles.arch && ./deploy.sh`
3. `paru -S noctalia-shell`
4. `paru -S zsh`
5. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
6. `curl -sS https://starship.rs/install.sh | sh`
7. `chsh -s $(which zsh)`
8. `reboot`
9. `paru -S rustup`
10. `rustup default nightly`
11. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
12. `curl https://mise.run | sh`
13. `mise use -g node npm bun deno uv`
14. `paru -S ghostty zed helium-browser-bin zellij-git yazi lazygit`
15. `paru -R alacritty`
16. `paru -S fcitx5-im fcitx5-mozc`
17. `sudo echo "ja_JP.UTF-8 UTF-8" | sudo tee /etc/locale.gen`
18. `sudo locale-gen`
19. `paru -S noto-fonts-cjk`
20. `paru -S nerd-fonts-git`
21. `fc-cache -fv`
22. `starship preset nerd-font-symbols -o ~/.config/starship.toml`
23. `paru -S wl-clipboard`

```bash
sudo tee -a /etc/environment << 'EOF'
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF
```

GOAL

