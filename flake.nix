{
  description = ''
    My Nix Configuration
  '';

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: nixpkgs.legacyPackages.${system});
      nixosConfigurations = {
        ideapad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/ideapad ];
        };
      };
    };
}
