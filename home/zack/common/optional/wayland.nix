{ pkgs, ... }: {
  home.packages = with pkgs; [
    lxqt.lxqt-policykit
    clipse
    swaylock
    wev
    wl-kbptr
    wlrctl
  ];
}
