{
  description = "Home Manager configuration of jedi";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      linuxPkgs = nixpkgs.legacyPackages.x86_64-linux;
      darwinPkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in
    {
      homeConfigurations."jedi@linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        modules = [ ./linux.nix ];
      };

      homeConfigurations."jedi@darwin" = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPkgs;
        modules = [ ./darwin.nix ];
      };
    };
}
