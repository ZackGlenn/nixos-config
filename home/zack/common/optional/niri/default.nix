{ ... }:
{
  imports = [
    # niri configs
    ./binds.nix
    ./input.nix
    ./output.nix
    ./environment.nix
    ./switch-events.nix
    ./layout.nix
    ./options.nix
    ./window-rule.nix
    ./layer-rule.nix
    ./animations.nix
    ./gestures.nix
    ./debug.nix

    # other stuff to setup
    ../waybar
    ./waybar-extend.nix
    ./wpaperd.nix
  ];
}
