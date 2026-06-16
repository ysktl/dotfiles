# Debian dotfiles

## Install

1. `sudo apt install -y curl wget git gh vim zsh xz-utils libatomic1 make cmake keychain uidmap usbutils dbus-user-session`
2. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ysktl`
3. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
4. `curl -sS https://starship.rs/install.sh | sh`
5. `chsh -s $(which zsh)`
6. `sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`
7. 新規ターミナル作成
8. `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
9. `nix-channel --update`
10. `nix-shell '<home-manager>' -A install`
11. `sudo mkdir -p /etc/nix`
12. `sudo echo "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf`
13. `sudo systemctl restart nix-daemon`
14. `cd ~/nix && home-manager switch --flake .`
15. `rustup default nightly`
16. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
17. `mise use -g node npm bun deno uv pkl k9s`
18. `systemctl start dbus --user`
19. `sudo mkdir -p /etc/containers`

```bash
cat << 'EOF' | sudo tee /etc/containers/policy.json
{
    "default": [
        {
            "type": "insecureAcceptAnything"
        }
    ],
    "transports": {}
}
EOF
```

20. `sudo mount --make-rshared /`
21. `sudo echo 'unqualified-search-registries = ["docker.io"]' | sudo tee /etc/containers/registries.conf`

