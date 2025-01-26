{ config, ... }:
{
  imports = [
    ./common.nix
    ./git.nix
    ./shell.nix
    ./mpv.nix
    ./mpd.nix
    ./ncmpcpp.nix
  ];
}
