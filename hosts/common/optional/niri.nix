{ pkgs, inputs, ... }:
{
  imports = [ inputs.niri-flake.nixosModules.niri ];

  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
    xwayland-satellite-unstable # provided by niri-flake
    nautilus
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable; # provided by niri-flake
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
