{pkgs, inputs, outputs, config, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.niri-flake.nixosModules.niri
    ./locale.nix
    ./nix.nix
    ./sops.nix
    ./neovim.nix
    ./nvd.nix
    ./firmware.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
    inherit (config.networking) hostName;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";

  nixpkgs = {
    overlays = [ outputs.overlays.default ];
    config = {
      allowUnfree = true;
    };
  };
}
