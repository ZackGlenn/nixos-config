{ pkgs, ... }: {
  home.packages = [ pkgs.pavucontrol ];
  services.playerctld.enable = true;
}
