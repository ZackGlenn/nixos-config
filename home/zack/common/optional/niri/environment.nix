{...}: {
  # tell xwayland-sattelite where to spawn things
  # See: https://github.com/YaLTeR/niri/wiki/Xwayland
  programs.niri.settings.environment = {
    DISPLAY = ":0";
  };
}
