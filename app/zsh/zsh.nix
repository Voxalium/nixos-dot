{config, pkgs, lib, ...}:
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

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    initExtra = ''
      autoload -Uz vcs_info
      precmd_vcs_info() { vcs_info }
      precmd_functions+=( precmd_vcs_info )
      setopt prompt_subst

      PROMPT="%B%F{#ff8020}%m%f%b %~ "$'\n'"%(?.%B->%b "
      RPROMPT="%T %K{#ff8020}%B "\$vcs_info_msg_0_" %K%b"
      zstyle ':vcs_info:*' check-for-changes true
      zstyle ':vcs_info:git*' formats '%b %m%u%c'
    '';

  };
}
