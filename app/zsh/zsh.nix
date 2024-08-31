{config, pkgs, ...}:
let
  alias = {
    ".."="cd ..";
    la="ls -la";
    neoconf="nvim ~/.config/nvim/init.lua";
    hyprconf="nvim ~/.config/hypr/hyprland.conf";
    nixconf="nvim ~/.dotfiles/configuration.nix";
    homeconf="nvim ~/.dotfiles/home.nix";
    nrs="sudo nixos-rebuild switch --flake ~/.dotfiles/";
    nfu="sudo nix flake update ~/.dotfiles/";
    hms="home-manager switch --flake ~/.dotfiles/";
    ncg="sudo nix-collect-garbage -d";

  };
in
  {
  programs.zsh = {
    enable = true;
    shellAliases = alias;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      PROMPT="%B%F{#ff8020}%m%f%b %~ "$'\n'"%(?.%B->%b " 
      RPROMPT="%T"
    '';
  };
}
