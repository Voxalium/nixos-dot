{ config, pkgs, ... }:
{
  imports = [
  ./app/sh.nix
  ./app/kitty.nix
  ./app/hyprland/hyprland.nix
  ./app/hyprland/hyprpaper.nix
  ./app/waybar/waybar.nix
  ./app/zsh/zsh.nix
  ];

  home = {
    username = "voxa";
    homeDirectory = "/home/voxa";
    stateVersion = "24.05"; 
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  programs.git = {
    enable = true;
    userName = "Voxalium";
    userEmail = "voxalium@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.home-manager.enable = true;
}
