{ config, pkgs, ...}:

{
  
  home.username = "ysktl";
  home.homeDirectory = "/home/ysktl";

  home.packages = with pkgs; [
    wget
    gawk
    fzf
    ripgrep
    neovim
    lazygit
    yazi
    rustup
    go
    uv
    mise
    opencode
    openssh
    ansible
    opentofu
    terraform
    podman
    podman-compose
    go-task
    nerd-fonts.go-mono
    nerd-fonts.hack
    jujutsu
    libclang
    cmake
    cmake-lint
    cmake-format
    pgformatter
    luarocks
  ];
  
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
} 
