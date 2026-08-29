#!/usr/bin/env bash

set -euo pipefail

# Distro

source /etc/os-release

echo "Initializing installation...."

if [ "$ID" == "debian" ]; then
  if ! command -v nix >/dev/null 2>&1; then
    sudo apt install -y curl wget unzip gh vim zsh xz-utils libatomic1 make cmake keychain uidmap usbutils dbus-user-session fontconfig
    sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
    echo "Installed nix, Run ./install.sh again after restarting"
    exit 0
  else
    echo "Found nix command, Installing packages..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
    sudo mkdir -p /etc/nix
    echo "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf
    sudo systemctl restart nix-daemon
    cd ~/dotfiles/home/nix && home-manager switch --flake .
    systemctl start dbus --user
    sudo mkdir -p /etc/containers
    echo '{ "default": [ { "type": "insecureAcceptAnything" } ], "transports": {} }' | sudo tee /etc/containers/policy.json
    sudo mount --make-rshared /
    echo 'unqualified-search-registries = ["docker.io"]' | sudo tee /etc/containers/registries.conf
  fi
elif [ "$ID" == "arch" ]; then
  sudo pacman -S --noconfirm git vim github-cli base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru && makepkg -si
  paru -S --noconfirm neovim noctalia-shell zsh rustup ghostty zed helium-browser-bin yazi lazygit fcitx5-im fcitx5-mozc noto-fonts-cjk wl-clipboard jujutsu lazyjj
elif [ "$ID" == "opensuse-tumbleweed" ]; then
  sudo zypper addrepo https://download.opensuse.org/repositories/home:itachi_re/openSUSE_Tumbleweed/home:itachi_re.repo
  sudo zypper refresh
  sudo zypper install lua51-lpeg git vim gh neovim zsh rustup yazi lazygit ghostty fcitx5-mozc
elif [ "$ID" == "fedora" ]; then
  :
elif [ "$ID" == "void" ]; then
  :
fi

echo "Finished initializing."

# Common

echo "Starting common packages installation..."

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ysktl
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
curl -sS https://starship.rs/install.sh | sh
chsh -s $(command -v zsh)
rustup default nightly
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
curl https://mise.run | sh
mise use -g node npm bun deno uv pkl k9s
git clone https://github.com/ysktl/nvim.git ~/.config/nvim/
echo "ja_JP.UTF-8 UTF-8" | sudo tee /etc/locale.gen
sudo locale-gen
fc-cache -fv
curl -fsSL https://herdr.dev/install.sh | sh
cargo install --locked zellij

# Nerd fonts

fonts_list=("Go-Mono" "Hack" "JetbrainsMono")
select font_name in "${fonts_list[@]}" "Quit";
  do
    if [ "$(command -v curl)" ]; then
      if [ -n "$font_name" ]; then
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        echo "creating fonts folder: ${HOME}/.fonts"
        mkdir -p  "$HOME/.fonts"
        echo "unzip the $font_name.zip"
        unzip "$font_name.zip" -d "$HOME/.fonts/$font_name/"
        fc-cache -fv
      fi
    else
      echo "curl command not found."
      exit 127
    fi
  done

echo "All installation completed."
exit 0

