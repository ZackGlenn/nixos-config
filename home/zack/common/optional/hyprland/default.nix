{ pkgs, ... }:
{
  imports = [
    ../waybar
    ./waybar_extend.nix
    ./hyprlock.nix
    ./gtk.nix
    ./qt.nix
    ./variables.nix
    ./autostart.nix
    ./keybinds.nix
    ./look_and_feel.nix
    ./layouts.nix
    ./window_rules.nix
    ./extra_config.nix
  ];

  home.packages = with pkgs; [
    hyprcursor
    powermenu
    hyprpass
    bluetoggle
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Don't scale xwayland windows
      # fixes fonts being pixelated in xwayland
      xwayland = {
        force_zero_scaling = true;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background :(
      };

    };
  };
}
