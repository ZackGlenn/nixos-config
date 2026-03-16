{pkgs, ...}: {
  programs.hyprland.enable = true;
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:swapescape";
    };
  };
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = [ pkgs.wl-clipboard ];
  };
}
