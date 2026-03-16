{...}: {
  # See https://wiki.hyprland.org/Configuring/Keywords
  # Set programs that you use
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
    "$terminal" = "kitty";
    "$fileManager" = "kitty yazi";
    "$browser" = "qutebrowser";
    "$menu" = "tofi-drun | xargs hyprctl dispatcher exec --";
    "$menu_full" = "tofi-run | xargs hyprctl dispatcher exec --";
  };
}

