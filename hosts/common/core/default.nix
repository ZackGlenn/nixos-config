{
  pkgs,
  inputs,
  outputs,
  config,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./locale.nix
    ./nix.nix
    ./sops.nix
    ./neovim.nix
    ./nvd.nix
    ./firmware.nix
  ]
  ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
    inherit (config.networking) hostName;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";
  home-manager.sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];

  # required bc of using HM as a nixos module so that portal definitions and DE provided configurations get linked
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  nixpkgs = {
    overlays = [ outputs.overlays.default ];
    config = {
      allowUnfree = true;
    };
  };
}
