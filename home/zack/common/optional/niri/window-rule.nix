{...}: {
  programs.niri.settings = {
    # Window rules let you adjust behavior for individual windows.
    # Find more information on the wiki:
    # https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules
    window-rules = [
      {
        matches = [ { app-id = "Kenku FM"; } ];
        default-column-width = { proportion = 0.5; };
      }
    ];
  };
}
