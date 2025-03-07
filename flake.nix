{
  description = "Nixos config flake";

  inputs = {
    #
    # ========= Official NixOS and HM Package Sources =========
    #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # The next two inputs are for pinning to stable or unstable regardless of what the main input is set to
    # This is useful to keep some packages on stable while testing a beta release of nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #
    # ========= Utilities =========
    #
    # Secrets management
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (nixpkgs) lib;
  in
  {
    #
    # ========= Host Configurations =========
    #
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zack = import ./home/home.nix;
            home-manager.extraSpecialArgs = {
              pkgs-stable = import inputs.pkgs-stable {system = nixpkgs.system;};
              pkgs-unstable = import inputs.pkgs-unstable {system = nixpkgs.system;};
            };
          }
        ];
      };
    };
  };
}
