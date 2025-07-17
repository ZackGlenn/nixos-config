{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
  environment.systemPackages = with pkgs; [ wl-clipboard xwayland-satellite ];
  programs.niri.enable = true;
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:swapescape";
    };
  };
}
