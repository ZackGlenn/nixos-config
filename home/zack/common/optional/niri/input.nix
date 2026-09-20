{ ... }:
{
  wayland.windowManager.niri.settings.input = {
    keyboard = {
      xkb = {
        # You can set rules, model, layout, variant and options.
        # For more information, see xkeyboard-config(7).

        # For example:
        # layout = "us,ru"
        # options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps"

        # If this section is empty, niri will fetch xkb settings
        # from org.freedesktop.locale1. You can control these using
        # localectl set-x11-keymap.
      };

      # Enable numlock on startup, omitting this setting disables it.
      numlock = { };
    };

    # Next sections include libinput settings.
    # Omitting settings disables them, or leaves them at their default values.
    # All commented-out settings here are examples, not defaults.
    touchpad = {
      # off = true;
      tap = { };
      # dwt = true;
      # dwtp = true;
      # drag = false;
      # drag-lock = true;
      natural-scroll = { };
      # accel-speed = 0.2
      # accel-profile = "flat"
      # scroll-method = "two-finger"
      # disabled-on-external-mouse = true;
    };

    mouse = {
      # off = true;
      # natural-scroll = true;
      # accel-speed 0.2 = true;
      # accel-profile "flat" true;
      # scroll-method "no-scroll" = true;
      scroll-factor = 1.0;
    };

    trackpoint = {
      # off = true;
      # natural-scroll = true;
      # accel-speed = 0.2
      # accel-profile = "flat"
      # scroll-method = "on-button-down"
      # scroll-button = 273
      # scroll-button-lock = true;
      # middle-emulation = true;
    };

    # Uncomment this to make the mouse warp to the center of newly focused windows.
    # warp-mouse-to-focus = true;

    # Focus windows and outputs automatically when moving the mouse into them.
    # Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
    focus-follows-mouse = { };
  };
}
