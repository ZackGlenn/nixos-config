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
    inherit (self) outputs;
    inherit (nixpkgs) lib;

    #
    # ========= Architectures =========
    #
    forAllSystems = lib.genAttrs [
      "x86_64-linux"
      # "aarch64-linux" TODO: check correctness
    ];
  in {

    # ========= Custom Modules =========
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # ========= Overlays =========
    # 
    # Custom modifications to upstream packages
    overlays = import ./overlays { inherit inputs; };

    # ========= Custom Packages =========
    packages = forAllSystems (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      in
      lib.packagesFromDirectoryRecursive {
        callPackage = lib.callPackageWith pkgs;
        directory = ./pkgs/common;
      }
    );

    # ========= Scripts =========
    scripts = import ./scripts;

    # ========= Formatter =========
    # TODO:

    # ========= DevShell =========
    devShells = forAllSystems (
      system:
      import ./shell.nix {
        pkgs = nixpkgs.legacyPackages.${system};
      }
    );

    #
    # ========= Host Configurations =========
    #
    nixosConfigurations = {
      # laptop
      laptop = lib.nixosSystem {
        modules = [ ./hosts/laptop ];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
