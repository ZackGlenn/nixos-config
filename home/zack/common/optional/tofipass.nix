{ pkgs, ... }:
{
  imports = [
    ./keepassxc.nix
    ./tofi.nix
  ];

  home.packages = [ pkgs.tofipass ];
}
