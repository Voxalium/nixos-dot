{config, pkgs, ...}:
{
    services = {
      hyprpaper.enable = true;
      hyprpaper.settings = {
        splash = false;
        preload = "~/Images/CATGIRL.jpg";
        wallpaper = "HDMI-A-1,~/Images/CATGIRL.jpg";
      };
    };
}
