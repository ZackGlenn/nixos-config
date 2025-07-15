{...}: {
  imports = [
    ./binds.nix
    ./input.nix
    ./output.nix
    ./switch-events.nix
    ./layout.nix
    ./options.nix
    ./window-rule.nix
  ];

  programs.niri = {
    enable = true;
    settings = {
      environment."NIXOS_OZONE_WL" = "1";
    };
  };
}
