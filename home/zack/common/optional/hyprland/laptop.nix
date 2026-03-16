{...}: {
# See https://wiki.hyprland.org/Configuring/Monitors/
wayland.windowManager.hyprland.settings.monitor = ", preferred, auto, 1.25";

services.hyprpaper = {
  enable = true;
  settings = {
    preload = [
      "~/Pictures/wallpapers/The Way of Kings.jpg"
      "~/Pictures/wallpapers/Rhythm of War.jpg"
    ];
    wallpaper = [
      "eDP-1,~/Pictures/wallpapers/The Way of Kings.jpg"
      "HDMI-A-1,~/Pictures/wallpapers/Rhythm of War.jpg"
    ];
  };
};
}
