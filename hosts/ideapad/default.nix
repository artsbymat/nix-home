{ config, inputs, outputs, lib, pkgs, ... }:
{
   imports = [
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
   ];

   home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.rahmat = import ../../home/nixos;
   };
}
