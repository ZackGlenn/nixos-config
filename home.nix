  # Home manager config
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    ripgrep
    joshuto
    qutebrowser
    fish
    lxqt.lxqt-policykit
    clipse
    overskride
    brightnessctl
  ];

  programs.kitty = {
    enable = true;
    settings.confirm_os_window_close = 0;
  };

  programs.tofi = {
    enable = true;
    settings.terminal = "kitty";
  };

  services.dunst.enable = true;
  services.playerctld.enable = true;

  # Configure hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./hyprland.nix;


  # state version is required and should stay at the initial version
  home.stateVersion = "24.05";
}
