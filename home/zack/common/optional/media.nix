{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    playerctl
  ];
  services.playerctld.enable = true;
}
