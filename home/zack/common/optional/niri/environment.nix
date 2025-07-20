{ ... }:
{
  programs.niri.settings.environment = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";

    # tell xwayland-sattelite where to spawn things
    # See: https://github.com/YaLTeR/niri/wiki/Xwayland
    DISPLAY = ":0";
  };
}
