{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  environment.systemPackages = with pkgs; [
    wl-clipboard
    xwayland-satellite-stable # provided by niri-flake
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable; # provided by niri-flake
  };
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
