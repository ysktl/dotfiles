# My dotfiles

## Installation for Debian on WSL

1. `sudo apt install curl wget git gh vim zsh xz-utils libatomic1 make cmake keychain uidmap usbutils dbus-user-session`
2. `git clone https://github.com/ysktl/.dotfiles.debian.git ~/.dotfiles.debian/`
3. `cd ~/.dotfiles.debian && ./deploy.sh`
4. `bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"`
5. `curl -sS https://starship.rs/install.sh | sh`
6. `chsh -s $(which zsh)`
7. `sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`
8. `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
9. `nix-channel --update`
8. reboot
9. `nix-shell '<home-manager>' -A install`
10. `sudo mkdir -p /etc/nix`
11. `sudo echo "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf`
12. `sudo systemctl restart nix-daemon`
13. `cd ~/.dotfiles.debian/nix && home-manager switch --flake .`
14. `rustup default nightly`
15. `git clone https://github.com/ysktl/nvim.git ~/.config/nvim/`
16. `mise use -g node npm bun deno uv pkl`
17. `systemctl start dbus --user`
18. JDK and Scala Install
  - [temurin-25-jdk](https://adoptium.net/installation/linux#_deb_installation_on_debian_or_ubuntu)
  - [Scala3](https://docs.scala-lang.org/getting-started/install-scala.html#)
19. `sudo mkdir -p /etc/containers`
20. Run it

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

21. `sudo mount --make-rshared /`

GOAL

