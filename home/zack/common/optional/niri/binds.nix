{ config, ... }:
{

  # See https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
  wayland.windowManager.niri.settings.binds = {
    # show a list of important hotkeys
    "Mod+Shift+Slash".show-hotkey-overlay = { };

    #
    # ========= Binds for running programs ========
    #
    "Mod+Return" = {
      spawn = [ "kitty" ];
      _props.hotkey-overlay-title = "Open a Terminal: kitty";
    };

    "Mod+R" = {
      spawn = [
        "sh"
        "-c"
        "niri msg action spawn -- $(tofi-drun)"
      ];
      _props.hotkey-overlay-title = "Run an Application: tofi";
    };

    "XF86ScreenSaver" = {
      spawn = [ "swaylock" ];
      _props.hotkey-overlay-title = "Lock the Screen: swaylock";
    };

    "Mod+B" = {
      spawn = [ "qutebrowser" ];
      _props.hotkey-overlay-title = "Launch a Browser: qutebrowser";
    };

    "Mod+E" = {
      spawn = [
        "kitty"
        "yazi"
      ];
      _props.hotkey-overlay-title = "Launch a File Manager: yazi";
    };

    "Mod+C".spawn = [
      "bluetoggle"
      "B8:7B:D4:15:C5:5D"
    ];
    "Mod+D".spawn = [
      "dunstctl"
      "close-all"
    ];
    "Mod+A".spawn = [
      "tofipass"
      "-d"
      "/home/zack/Sync/Passwords/Passwords.kdbx"
    ];
    "Mod+Shift+A".spawn = [
      "tofipass"
      "-p"
      "-d"
      "/home/zack/Sync/Passwords/Passwords.kdbx"
    ];

    #
    # ========= Media keys =========
    #
    # using allow-when-locked makes these work even with the session locked
    "XF86AudioRaiseVolume" = {
      spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1+"
      ];
      _props.allow-when-locked = true;
    };

    "XF86AudioLowerVolume" = {
      spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1-"
      ];
      _props.allow-when-locked = true;
    };

    "XF86AudioMute" = {
      spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      _props.allow-when-locked = true;
    };

    "XF86AudioMicMute" = {
      spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
      _props.allow-when-locked = true;
    };

    "XF86AudioNext" = {
      spawn = [
        "exec"
        "playerctl"
        "next"
      ];
    };

    "XF86AudioPause" = {
      spawn = [
        "playerctl"
        "play-pause"
      ];
    };

    "XF86AudioPlay" = {
      spawn = [
        "playerctl"
        "play-pause"
      ];
    };

    "XF86AudioPrev" = {
      spawn = [
        "exec"
        "playerctl"
        "previous"
      ];
    };

    #
    # ========= Brightness keys =========
    #
    "XF86MonBrightnessUp" = {
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+10%"
      ];
      _props.allow-when-locked = true;
    };

    "XF86MonBrightnessDown" = {
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "10%-"
      ];
      _props.allow-when-locked = true;
    };

    # Open/close the Overview
    "Mod+O" = {
      toggle-overview = { };
      _props.repeat = false;
    };

    # Close window
    "Mod+W" = {
      close-window = { };
      _props.repeat = false;
    };

    #
    # ========= Navigation =========
    #
    "Mod+Left".focus-column-left = { };
    "Mod+Down".focus-window-or-workspace-down = { };
    "Mod+Up".focus-window-or-workspace-up = { };
    "Mod+Right".focus-column-right = { };
    "Mod+H".focus-column-left = { };
    "Mod+J".focus-window-or-workspace-down = { };
    "Mod+K".focus-window-or-workspace-up = { };
    "Mod+L".focus-column-right = { };

    "Mod+Shift+Left".move-column-left = { };
    "Mod+Shift+Down".move-window-down-or-to-workspace-down = { };
    "Mod+Shift+Up".move-window-up-or-to-workspace-up = { };
    "Mod+Shift+Right".move-column-right = { };
    "Mod+Shift+H".move-column-left = { };
    "Mod+Shift+J".move-window-down-or-to-workspace-down = { };
    "Mod+Shift+K".move-window-up-or-to-workspace-up = { };
    "Mod+Shift+L".move-column-right = { };

    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+Down".move-window-to-monitor-down = { };
    "Mod+Shift+Ctrl+Up".move-window-to-monitor-up = { };
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = { };
    "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+J".move-window-to-monitor-down = { };
    "Mod+Shift+Ctrl+K".move-window-to-monitor-up = { };
    "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };

    "Mod+U".move-workspace-down = { };
    "Mod+I".move-workspace-up = { };

    # Move the focused window in and out of a column
    # If the window is alone, consume it into the nearby column to the side
    # If the window is already in a column, expel it
    "Mod+Ctrl+Left".consume-or-expel-window-left = { };
    "Mod+Ctrl+Right".consume-or-expel-window-right = { };
    "Mod+Ctrl+H".consume-or-expel-window-left = { };
    "Mod+Ctrl+L".consume-or-expel-window-right = { };

    # Consume one window from the right to the bottom of focused column
    "Mod+Comma".consume-window-into-column = { };
    # Expel the bottom window from the focused column to the right
    "Mod+Period".expel-window-from-column = { };

    "Mod+S".switch-preset-column-width = { };
    "Mod+Shift+S".switch-preset-window-height = { };
    "Mod+Ctrl+S".reset-window-height = { };
    "Mod+F".maximize-column = { };
    "Mod+Shift+F".fullscreen-window = { };

    # Expand the focused column to space not taken up by other fully visible columns
    # Makes the column "fill the rest of the space"
    "Mod+Ctrl+F".expand-column-to-available-width = { };

    "Mod+M".center-column = { };
    # Center all fully visible columns on screen
    "Mod+Ctrl+M".center-visible-columns = { };

    # Finer width adjustments
    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";

    # Finer height adjustments when in column with other windows
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";

    # Move the focused window between the floating and the tiling layout
    "Mod+V".toggle-window-floating = { };
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };

    # Toggle tabbed column display mode
    # Windows in this column will appear as vertical tabs,
    # rather than stacked on top of each other
    "Mod+Q".toggle-column-tabbed-display = { };

    # Actions to switch layouts
    # Make sure not to have a layout switch key in the xkb options or this will break
    "Mod+Space".switch-layout = "next";
    "Mod+Shift+Space".switch-layout = "prev";

    # Some applications such as remote-desktop clients may request that niri stops processing the keyboard
    # shortcuts defined here so they can forward the key presses.
    # It's a good idea to bind an escape hatch to keep them from holding the session hostage
    "Mod+Escape" = {
      toggle-keyboard-shortcuts-inhibit = { };
      _props.allow-inhibiting = false;
    };

    # The quit action will show a dialog to prevent accidental exits
    "Mod+Shift+E".quit = { };

    # Powers off the monitors. To turn them back on, do any input like moving the mouse or pressing a key
    "Mod+Shift+P".power-off-monitors = { };
  };
}
