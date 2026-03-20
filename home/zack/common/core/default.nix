{
  pkgs,
  lib,
  outputs,
  ...
}:
{

  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./fonts.nix
    ./btop.nix
    ./yazi.nix
    ./nvim
    ./nix-index.nix
  ]
  ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = lib.mkDefault "zack";
    homeDirectory = lib.mkDefault "/home/{config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 16;
  };

  home.packages = with pkgs; [
    bat
    ripgrep
    clipse
    dust
    tldr
    fastfetch
    usbutils
    zip
    unzip
  ];
}
