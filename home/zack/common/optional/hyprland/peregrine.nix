{...}: {
# See https://wiki.hyprland.org/Configuring/Monitors/
wayland.windowManager.hyprland.settings = {
  monitor = ", 2560x1440@180, auto, 1.25";
  misc.vrr = 1;
};

services.hyprpaper = {
  enable = true;
  settings = {
    preload = [
      "~/Pictures/wallpapers/The Way of Kings.jpg"
      "~/Pictures/wallpapers/Rhythm of War.jpg"
    ];
    wallpaper = [
      "DP-1,~/Pictures/wallpapers/The Way of Kings.jpg"
      ",~/Pictures/wallpapers/Rhythm of War.jpg"
    ];
  };
};
}
