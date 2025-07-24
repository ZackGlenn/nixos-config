{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
    xwayland-satellite-unstable # provided by niri-flake
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
