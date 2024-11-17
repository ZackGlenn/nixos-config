  # Home manager config
{config, lib, pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./nvim/nvim.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./waybar/waybar.nix
  ];

  home.packages = with pkgs; [
    bat
    ripgrep
    joshuto
    fish
    lxqt.lxqt-policykit
    clipse
    brightnessctl
    pavucontrol
    btop
    dust
    tldr
    cowsay
    cmatrix
    asciiquarium
    neofetch
    networkmanagerapplet
  ];

  programs.tofi = {
    enable = true;
    settings.terminal = "kitty";
  };

  services.dunst.enable = true;
  services.playerctld.enable = true;

  # Configure hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./hyprland.nix;

  home.activation = {
  # Workaround for tofi not recognizing changes to .desktop files
  # See https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
  regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    tofi_cache=${config.xdg.cacheHome}/tofi-drun
    [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
  '';
  };

  # state version is required and should stay at the initial version
  home.stateVersion = "24.05";
}
