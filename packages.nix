{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
  #CMD
      git
      pnpm
      nodejs_22
      htop
      fzf
      gcc
      cl
      clang
      unzip
      networkmanager
      zsh
      zip
      wget
      dotnetCorePackages.sdk_9_0
      dotnetCorePackages.runtime_9_0
      luajitPackages.luarocks-nix
      lua
      python3
      neofetch
      neovim
      kitty
      xdg-user-dirs
  #GUI
      polkit_gnome
      flameshot
      xfce.thunar
      pavucontrol
      helvum
      firefox
      thunderbird
      mpv
      discord
  #WM
      bspwm
  #NODE
      nodePackages."live-server"
  ];
  
}
