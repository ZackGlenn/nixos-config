{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      "$mainMod, Return, exec, $terminal"
      "$mainMod, W, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, B, exec, $browser"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, X, exec, powermenu"
      "$mainMod, C, exec, bluetoggle B8:7B:D4:15:C5:5D"
      "$mainMod SHIFT, R, exec, $menu_full"
      "$mainMod, A, exec, tofipass -d ~/Sync/Passwords/Passwords.kdbx"
      "$mainMod SHIFT, A, exec, tofipass -p -d ~/Sync/Passwords/Passwords.kdbx"
      "$mainMod, D, exec, dunstctl close-all"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, T, togglesplit," # dwindle
      "$mainMod, SPACE, fullscreen, 1" # dwindle

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Move focus with mainMod + hjkl
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Move focused window with mainMod + SHIFT + arrow keys
      "$mainMod SHIFT, left, swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up, swapwindow, u"
      "$mainMod SHIFT, down, swapwindow, d"

      # Move focused window with mainMod + SHIFT + hjkl
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, L, movewindow, r"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, J, movewindow, d"

      # Resize focused window with mainMod + CTRL + hjkl
      "$mainMod CTRL, H, resizeactive, -96 0"
      "$mainMod CTRL, L, resizeactive, 96 0"
      "$mainMod CTRL, K, resizeactive, 0 -54"
      "$mainMod CTRL, J, resizeactive, 0 54"

      # Switch workspasces with mainMod + [0-9]
      "$mainMod, 1, focusworkspaceoncurrentmonitor, 1"
      "$mainMod, 2, focusworkspaceoncurrentmonitor, 2"
      "$mainMod, 3, focusworkspaceoncurrentmonitor, 3"
      "$mainMod, 4, focusworkspaceoncurrentmonitor, 4"
      "$mainMod, 5, focusworkspaceoncurrentmonitor, 5"
      "$mainMod, 6, focusworkspaceoncurrentmonitor, 6"
      "$mainMod, 7, focusworkspaceoncurrentmonitor, 7"
      "$mainMod, 8, focusworkspaceoncurrentmonitor, 8"
      "$mainMod, 9, focusworkspaceoncurrentmonitor, 9"
      "$mainMod, 0, focusworkspaceoncurrentmonitor, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # Switch workspaces with mainMod + yuiop
      "$mainMod, y, focusworkspaceoncurrentmonitor, 1"
      "$mainMod, u, focusworkspaceoncurrentmonitor, 2"
      "$mainMod, i, focusworkspaceoncurrentmonitor, 3"
      "$mainMod, o, focusworkspaceoncurrentmonitor, 4"
      "$mainMod, p, focusworkspaceoncurrentmonitor, 5"

      # Move active window to a workspace with mainMod + SHIFT + yuiop
      "$mainMod SHIFT, y, movetoworkspacesilent, 1"
      "$mainMod SHIFT, u, movetoworkspacesilent, 2"
      "$mainMod SHIFT, i, movetoworkspacesilent, 3"
      "$mainMod SHIFT, o, movetoworkspacesilent, 4"
      "$mainMod SHIFT, p, movetoworkspacesilent, 5"

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspacesilent, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      # Requires playerctl
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
