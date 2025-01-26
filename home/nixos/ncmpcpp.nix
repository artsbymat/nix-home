{ config, ... }:
{
  programs.ncmpcpp = {
    enable = true;
    settings = {
      ncmpcpp_directory = "/home/rahmat/.local/share/ncmpcpp";
      mouse_support = "yes";
    };
  };
}
