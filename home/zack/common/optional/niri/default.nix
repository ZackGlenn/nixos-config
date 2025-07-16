{...}: {
  imports = [
    ./binds.nix
    ./input.nix
    ./output.nix
    ./switch-events.nix
    ./layout.nix
    ./options.nix
    ./window-rule.nix
    ./layer-rule.nix
    ./animations.nix
    ./gestures.nix
    ./debug.nix
  ];

  programs.niri = {
    enable = true;
    settings = {
      environment."NIXOS_OZONE_WL" = "1";
    };
  };
}
