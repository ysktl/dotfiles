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
    podman
    podman-compose
    go-task
    nerd-fonts.go-mono
    nerd-fonts.hack
    jujutsu
  ];
  
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
} 
