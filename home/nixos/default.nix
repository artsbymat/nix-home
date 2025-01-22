{ config, ... }:
{
  imports = [
    ./common.nix
    ./git.nix
    ./shell.nix
  ];
}
