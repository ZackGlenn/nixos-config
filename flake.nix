{
  description = "Nixos config flake";

  inputs = {
    #
    # ========= Official NixOS and HM Package Sources =========
    #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # The next two inputs are for pinning to stable or unstable regardless of what the main input is set to
    # This is useful to keep some packages on stable while testing a beta release of nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
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

    # Raspberrypi infrastructure
    nixos-raspberrypi = {
      url = "github:nvmd/nixos-raspberrypi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #
    # ========= Addons =========
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;

      #
      # ========= Architectures =========
      #
      forAllSystems = lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {

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
      nixosConfigurations = with inputs; {
        # desktop
        peregrine = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/peregrine ];
          specialArgs = { inherit inputs outputs; };
        };

        # laptop
        laptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/laptop ];
          specialArgs = { inherit inputs outputs; };
        };

        # Raspberry Pi
        swallow = nixos-raspberrypi.lib.nixosSystemFull {
          system = "aarch64-linux";
          modules = [ ./hosts/swallow ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };

  #
  # ========= Nix Configuration =========
  #
  # Binary cache for the raspberrypi flake
  nixConfig = {
    extra-substituters = [
      "https://nixos-raspberrypi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];
  };
}
