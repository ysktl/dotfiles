# My dotfiles for SUSE (openSUSE) on Laptop

## Install

0. Require lua51-lpeg for nvim running.

```bash
sudo zypper addrepo https://download.opensuse.org/repositories/home:itachi_re/openSUSE_Tumbleweed/home:itachi_re.repo
sudo zypper refresh
sudo zypper install lua51-lpeg
```

1. *Install nerd-font and setting global fonts from Firefox*
2. `sudo zypper install git vim gh neovim zsh rustup zellij yazi lazygit ghostty fcitx5-mozc`
3. `git clone https://github.com/ysktl/.dotfiles.suse.git ~/.dotfiles.suse`
4. `cd ~/.dotfiles.suse && ./deploy.sh`
5. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
6. `curl -sS https://starship.rs/install.sh | sh`
7. `chsh -s $(which zsh)`
8. `rustup default nightly`
9. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
10. `curl https://mise.run | sh`
11. `mise use -g node npm bun deno uv`
12. `reboot`

GOAL

