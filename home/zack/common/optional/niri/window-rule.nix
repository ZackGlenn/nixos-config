{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    # Window rules let you adjust behavior for individual windows.
    # Find more information on the wiki:
    # https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules
    {
      window-rule._children = [
        {
          match._props = {
            app-id = "Kenku FM|steam";
          };
          default-column-width._children = [ { proportion = 0.5; } ];
        }

      ];
    }
  ];
}
