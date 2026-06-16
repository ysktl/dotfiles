# openSUSE dotfiles

## Install

1. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ysktl`
2. `sudo zypper addrepo https://download.opensuse.org/repositories/home:itachi_re/openSUSE_Tumbleweed/home:itachi_re.repo`
3. `sudo zypper refresh`
4. `sudo zypper install lua51-lpeg git vim gh neovim zsh rustup zellij yazi lazygit ghostty fcitx5-mozc`
5. *Install nerd-font and setting global fonts from Firefox*
6. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
7. `curl -sS https://starship.rs/install.sh | sh`
8. `chsh -s $(which zsh)`
9. `rustup default nightly`
10. `curl https://mise.run | sh`
11. `mise use -g node npm bun deno uv pkl k9s`
12. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
13. 再起動

