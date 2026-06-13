# openSUSE dotfiles

## Install

1. `sudo zypper addrepo https://download.opensuse.org/repositories/home:itachi_re/openSUSE_Tumbleweed/home:itachi_re.repo`
2. `sudo zypper refresh`
3. `sudo zypper install lua51-lpeg git vim gh neovim zsh rustup zellij yazi lazygit ghostty fcitx5-mozc`
4. *Install nerd-font and setting global fonts from Firefox*
5. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
6. `curl -sS https://starship.rs/install.sh | sh`
7. `chsh -s $(which zsh)`
8. `rustup default nightly`
9. `curl https://mise.run | sh`
10. `mise use -g node npm bun deno uv pkl`
11. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
12. 再起動

