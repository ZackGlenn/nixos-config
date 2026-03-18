{ inputs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./settings.nix
    ./qt.nix
    ./gtk.nix
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  # systemd startup is no longer supported
  systemd.user.services.noctalia-shell = lib.mkForce { };

  # noctalia brings it on notification system
  services.dunst.enable = lib.mkForce false;
}
