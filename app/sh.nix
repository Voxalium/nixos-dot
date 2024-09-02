{config, pkgs, ...}:

let
  alias = {
        ".."="cd ..";
        ls="ls --color=auto";
        la="ls -la --color=auto";
        neoconf="nvim ~/.config/nvim/init.lua";
        nixconf="nvim ~/.dotfiles/configuration.nix";
        homeconf="nvim ~/.dotfiles/home.nix";
        nrs="sudo nixos-rebuild switch --flake ~/.dotfiles/";
        nfu="sudo nix flake update ~/.dotfiles/";
        hms="home-manager switch --flake ~/.dotfiles/";
        ncg="sudo nix-collect-garbage -d";
  };
in
{ 
  programs = {
    bash = {
      enable = true;
      shellAliases = alias;
    };
  };
}
