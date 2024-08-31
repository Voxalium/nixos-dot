{config, pkgs, lib, ...}:
{
  home.packages = with pkgs;[
      polkit_gnome
      xdg-user-dirs
      xdg-desktop-portal-hyprland
      waybar
      hyprpaper
      hyprpicker
      hyprshot
      hyprland-protocols
      wofi
      wl-clipboard
      clipman
      mako
  ];
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
