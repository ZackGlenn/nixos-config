{ config, ... }:
{

  # See https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbindsnameaction
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # show a list of important hotkeys
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    #
    # ========= Binds for running programs ========
    #
    "Mod+Return" = {
      action = spawn "kitty";
      hotkey-overlay.title = "Open a Terminal: kitty";
    };

    "Mod+R" = {
      action = spawn "sh" "-c" "niri msg action spawn -- $(tofi-drun)";
      hotkey-overlay.title = "Run an Application: tofi";
    };

    "Super+Alt+L" = {
      action = spawn "swaylock";
      hotkey-overlay.title = "Lock the Screen: swaylock";
    };

    "Mod+B" = {
      action = spawn "qutebrowser";
      hotkey-overlay.title = "Launch a Browser: qutebrowser";
    };

    "Mod+E" = {
      action = spawn "kitty" "yazi";
      hotkey-overlay.title = "Launch a File Manager: yazi";
    };

    #
    # ========= Volume keys =========
    #
    # using allow-when-locked makes these work even with the session locked
    "XF86AudioRaiseVolume" = {
      action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
      allow-when-locked = true;
    };

    "XF86AudioLowerVolume" = {
      action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
      allow-when-locked = true;
    };

    "XF86AudioMute" = {
      action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      allow-when-locked = true;
    };

    "XF86AudioMicMute" = {
      action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      allow-when-locked = true;
    };

    #
    # ========= Brightness keys =========
    #
    "XF86MonBrightnessUp" = {
      action = spawn "brighnessctl" "--class=backlight" "set" "+10%";
      allow-when-locked = true;
    };

    "XF86MonBrightnessDown" = {
      action = spawn "brighnessctl" "--class=backlight" "set" "-10%";
      allow-when-locked = true;
    };

    # Open/close the Overview
    "Mod+O" = {
      action = toggle-overview;
      repeat = false;
    };

    # Close window
    "Mod+W" = {
      action = close-window;
      repeat = false;
    };

    #
    # ========= Navigation =========
    #
    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Right".action = focus-column-right;
    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+L".action = focus-column-right;

    "Mod+Ctrl+Left".action = move-column-left;
    "Mod+Ctrl+Down".action = move-window-down;
    "Mod+Ctrl+Up".action = move-window-up;
    "Mod+Ctrl+Right".action = move-column-right;
    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down;
    "Mod+Ctrl+K".action = move-window-up;
    "Mod+Ctrl+L".action = move-column-right;

    "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Down".action = move-window-to-monitor-down;
    "Mod+Shift+Ctrl+Up".action = move-window-to-monitor-up;
    "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+J".action = move-window-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-window-to-monitor-up;
    "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

    "Mod+U".action = move-workspace-down;
    "Mod+I".action = move-workspace-up;

    # Move the focused window in and out of a column
    # If the window is alone, consume it into the nearby column to the side
    # If the window is already in a column, expel it
    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;

    # Consume one window from the right to the bottom of focused column
    "Mod+Comma".action = consume-window-into-column;
    # Expel the bottom window from the focused column to the right
    "Mod+Period".action = expel-window-from-column;

    "Mod+D".action = switch-preset-column-width;
    "Mod+Shift+D".action = switch-preset-window-height;
    "Mod+Ctrl+D".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;

    # Expand the focused column to space not taken up by other fully visible columns
    # Makes the column "fill the rest of the space"
    "Mod+Ctrl+F".action = expand-column-to-available-width;

    "Mod+C".action = center-column;
    # Center all fully visible columns on screen
    "Mod+Ctrl+C".action = center-visible-columns;

    # Finer width adjustments
    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";

    # Finer height adjustments when in column with other windows
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    # Move the focused window between the floating and the tiling layout
    "Mod+V".action = toggle-window-floating;
    "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

    # Toggle tabbed column display mode
    # Windows in this column will appear as vertical tabs,
    # rather than stacked on top of each other
    "Mod+Q".action = toggle-column-tabbed-display;

    # Actions to switch layouts
    # Make sure not to have a layout switch key in the xkb options or this will break
    "Mod+Space".action = switch-layout "next";
    "Mod+Shift+Space".action = switch-layout "prev";

    # Some applications such as remote-desktop clients may request that niri stops processing the keyboard
    # shortcuts defined here so they can forward the key presses.
    # It's a good idea to bind an escape hatch to keep them from holding the session hostage
    "Mod+Escape" = {
      action = toggle-keyboard-shortcuts-inhibit;
      allow-inhibiting = false;
    };

    # The quit action will show a dialog to prevent accidental exits
    "Mod+Shift+E".action = quit;

    # Powers off the monitors. To turn them back on, do any input like moving the mouse or pressing a key
    "Mod+Shift+P".action = power-off-monitors;
  };
}
