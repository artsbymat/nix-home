{ config, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      volume = 60;
      autofit-larger = "40%x40%";
      screenshot-directory = "~/Pictures/screenshots/mpv";
      save-position-on-quit = true;
    };
    bindings = {
      "Ctrl+ALT+r" = "cycle_values video-rotate 90 180 270 0";
      "Ctrl+ALT+l" = "vf toggle hflip";
      "Ctrl+ALT+L" = "vf toggle vflip";
      "Ctrl+ALT+k" = "add sub-scale +0.1";
      "Ctrl+ALT+j" = "add sub-scale -0.1";
    };
  };
}
