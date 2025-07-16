{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
