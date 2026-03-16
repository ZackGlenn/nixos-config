{ pkgs, ... }:
{
  home.packages = with pkgs; [
    scarlett2
    alsa-scarlett-gui
  ];
}
