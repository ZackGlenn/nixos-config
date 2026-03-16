{ pkgs, ... }: {
  home.packages = with pkgs; [
    lxqt.lxqt-policykit
    clipse
    wev
    wl-kbptr
    wlrctl
  ];
}
