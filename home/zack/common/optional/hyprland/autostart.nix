{...}: {
wayland.windowManager.hyprland.settings = {
  # Autostart necessary processes (like notifications daemons, status bars, etc.)
  # or execute your favorite apps at launch like this:
  exec-once = [
    "hyprctl setcursor Bibata-Original-Classic 16"
    "lxqt-policykit-agent"
    "qutebrowser --nowindow" # autostart qb to improve time opening first window
    "$terminal"
    "[workspace special:magic silent] $terminal"
  ];
};
}
