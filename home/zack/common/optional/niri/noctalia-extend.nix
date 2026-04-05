{ config, lib, ... }:
{
  programs.niri.settings = {

    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 5.0;
          top-right = 5.0;
          bottom-left = 5.0;
          bottom-right = 5.0;
        };
      }
      { clip-to-geometry = true; }
    ];

    debug = {
      honor-xdg-activation-with-invalid-serial = { };
    };

    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];
    binds = with config.lib.niri.actions; {
      "Mod+D" = lib.mkForce {
        action = spawn "noctalia-shell" "ipc" "call" "notifications" "dismissAll";
      };

      "Mod+R" = lib.mkForce {
        action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
        hotkey-overlay.title = "Run an Application: noctalia launcher";
      };

      "Super+Alt+L" = lib.mkForce {
        action = spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";
        hotkey-overlay.title = "Lock the Screen: noctalia";
      };

      "Super+X" = lib.mkForce {
        action = spawn "noctalia-shell" "ipc" "call" "sessionMenu" "toggle";
        hotkey-overlay.title = "Toggle the session menu";
      };
    };

    environment = {
      QT_QPA_PLATFORMTHEME = "gtk3";
    };
  };
}
