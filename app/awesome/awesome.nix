{config, pkgs,...}:
{
  home.packages = with pkgs;[
      rofi
      clipman
      xclip
      picom
  ];
}
