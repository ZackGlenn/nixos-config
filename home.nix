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
    brightnessctl
    pavucontrol
  ];

  programs.kitty = {
    enable = true;
    settings.confirm_os_window_close = 0;
  };

  programs.tofi = {
    enable = true;
    settings.terminal = "kitty";
  };

  program.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = "${builtins.readFile ./nvim/options.lua}";
  };

  services.dunst.enable = true;
  services.playerctld.enable = true;

  # Configure hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./hyprland.nix;


  # state version is required and should stay at the initial version
  home.stateVersion = "24.05";
}
