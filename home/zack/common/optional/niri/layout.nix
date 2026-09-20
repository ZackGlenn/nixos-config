{ ... }:
{
  # Settings that influence how windows are positioned and sized.
  # Find more information on the wiki:
  # https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
  wayland.windowManager.niri.settings.layout = {
    # Set gaps around windows in logical pixels.
    gaps = 10;

    # When to center a column when changing focus, options are:
    # - "never", default behavior, focusing an off-screen column will keep at the left
    #   or right edge of the screen.
    # - "always", the focused column will always be centered.
    # - "on-overflow", focusing a column will center it if it doesn't fit
    #   together with the previously focused column.
    center-focused-column = "never";

    # Always put an empty workspace above the first, similar to the default empty workspace below the last
    empty-workspace-above-first = true;

    # You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
    preset-column-widths._children = [
      # Proportion sets the width as a fraction of the output width, taking gaps into account.
      # For example, you can perfectly fit four windows sized "proportion 0.25" on an output.
      # The default preset widths are 1/3, 1/2 and 2/3 of the output.
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }

      # Fixed sets the width in logical pixels exactly.
      # { fixed = 1920; };
    ];

    # You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
    # preset-window-heights = [];

    # You can change the default width of the new windows.
    default-column-width._children = [
      { proportion = 0.5; }
    ];
    # If you leave the brackets empty, the windows themselves will decide their initial width.
    # default-column-width = {};

    # By default focus ring and border are rendered as a solid background rectangle
    # behind windows. That is, they will show up through semitransparent windows.
    # This is because windows using client-side decorations can have an arbitrary shape.
    #
    # If you don't like that, you should uncomment `prefer-no-csd` below.
    # Niri will draw focus ring and border *around* windows that agree to omit their
    # client-side decorations.
    #
    # Alternatively, you can override it with a window rule called
    # `draw-border-with-background`.

    # You can change how the focus ring looks.
    focus-ring = {
      # Uncomment this line to disable the focus ring.
      # off

      # How many logical pixels the ring extends out from the windows.
      width = 2;

      # Colors can be set in a variety of ways:
      # - CSS named colors: "red"
      # - RGB hex: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
      # - CSS-like notation: "rgb(255, 127, 0)", rgba(), hsl() and a few others.

      # Color of the ring on the active monitor.
      active-color = "#7aa2f7";

      # Color of the ring on inactive monitors.
      #
      # The focus ring only draws around the active window, so the only place
      # where you can see its inactive-color is on other monitors.
      inactive-color = "#505050";
    };

    # Struts shrink the area occupied by windows, similarly to layer-shell panels.
    # You can think of them as a kind of outer gaps. They are set in logical pixels.
    # Left and right struts will cause the next window to the side to always be visible.
    # Top and bottom struts will simply add outer gaps in addition to the area occupied by
    # layer-shell panels and regular gaps.
    struts = {
      # left   = 64;
      # right  = 64;
      # top    = 64;
      # bottom = 64;
    };
  };
}
