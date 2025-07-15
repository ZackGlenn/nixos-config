{...}: {
  imports = [
    ./binds.nix
  ];

  programs.niri = {
    enable = true;
    settings = {
      environment."NIXOS_OZONE_WL" = "1";
    };
  };
}
