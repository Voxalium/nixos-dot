{config, pkgs, ...}:
{
  programs = {
    kitty = {
      enable = true;
      font = {
        name = "FiraCode";
        size = 12;
      };
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = "0";
        window_padding_width = 4;
      };
    };
  };
}
