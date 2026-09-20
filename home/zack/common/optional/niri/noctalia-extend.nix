{ config, lib, ... }:
{
  wayland.windowManager.niri.settings = {

    _children = [
      {
        window-rule._children = [
          { geometry-corner-radius = 12; }
          { clip-to-geometry = true; }
        ];
      }
      { spawn-at-startup = "noctalia-shell"; }
    ];

    debug = {
      honor-xdg-activation-with-invalid-serial = { };
    };

    binds = {
      "Mod+D" = lib.mkForce {
        spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "notifications"
          "dismissAll"
        ];
      };

      "Mod+R" = lib.mkForce {
        spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];
        _props.hotkey-overlay-title = "Run an Application: noctalia launcher";
      };

      "XF86ScreenSaver" = lib.mkForce {
        spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "lockScreen"
          "lock"
        ];
        _props.hotkey-overlay-title = "Lock the Screen: noctalia";
      };

      "Super+Alt+L" = lib.mkForce {
        spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "sessionMenu"
          "lockAndSuspend"
        ];
        _props.hotkey-overlay-title = "Lock and Suspend : noctalia";
      };

      "Super+X" = lib.mkForce {
        spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "sessionMenu"
          "toggle"
        ];
        _props.hotkey-overlay-title = "Toggle the session menu";
      };
    };

    environment = {
      QT_QPA_PLATFORMTHEME = "gtk3";
    };
  };
}
