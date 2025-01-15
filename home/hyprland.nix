{

################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor = ", preferred, auto, 1.5";


###################
### MY PROGRAMS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords

# Set programs that you use

"$terminal" = "kitty";
"$fileManager" = "kitty joshuto";
"$browser" = "qutebrowser";
"$menu" = "tofi-drun | xargs hyprctl dispatcher exec --";
"$menu_full" = "tofi-run | xargs hyprctl dispatcher exec --";


#################
### AUTOSTART ###
#################

# Autostart necessary processes (like notifications daemons, status bars, etc.)
# or execute your favorite apps at launch like this:

exec-once = [
  "hyprctl setcursor Bibata-Original-Classic 16"
  "lxqt-policykit-agent"
  "qutebrowser --nowindow" # autostart qb to improve time opening first window
  "$terminal"
  "[workspace special:magic silent] $terminal"
];


#############################
### ENVIRONMENT VARIABLES ###
#############################

# See https://wiki.hyprland.org/Configuring/Environment-variables/

env = [
  "XCURSOR_SIZE, 24"
  "HYPRCURSOR_SIZE, 24"
];


#####################
### LOOK AND FEEL ###
#####################

# See https://wiki.hyprland.org/Configuring/Variables/

# https://wiki.hyprland.org/Configuring/Variables/#general
general = {
  gaps_in = 5;
  gaps_out = 10;

  border_size = 2;
  
  # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
  "col.active_border" = "rgb(7AA2F7)";
  "col.inactive_border" = "rgba(595959aa)";

  # Set true to enable resizing windows by clicking and dragging on borders and gaps
  resize_on_border = false;

  # Please see https://wiki.hyprland.org/Configuring/Tearing before you trun this on
  allow_tearing = false;

  layout = "dwindle";
};

# https://wiki.hyprland.org/Configuring/Variables/#decoration
decoration = {
  rounding = 5;

  # Change transparency of focused and unfocused windows
  active_opacity = 1.0;
  inactive_opacity = 1.0;

  shadow = {
    enabled = true;
    range = 4;
    render_power = 3;
    color = "rgba(1a1a1aee)";
  };

  # https://wiki.hyprland.org/Configuring/Variables/#blur
  blur = {
    enabled = true;
    size = 3;
    passes = 1;

    vibrancy = 0.1696;
  };
};

# https://wiki.hyprland.org/Configuring/Variables/#animations
animations = {
  enabled = true;

  # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

  bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

  animation = [
    "windows, 1, 7, myBezier"
    "windowsOut, 1, 7, default, popin 80%"
    "border, 1, 10, default"
    "borderangle, 1, 8, default"
    "fade, 1, 7, default"
    "workspaces, 1, 6, default"
  ];
};

# Ref https://wiki.hyprland.org/Configuring/Workspaces-Rules/
# "Smart gaps" / "No gaps when only"
# uncomment all three if you wish to use that.

# TODO: workspace rules nonsense from the default config

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
dwindle = {
  pseudotile = true; # Master switch for pseduotiling. Enabling is bout to mainMod + P in the keybinds section below
  preserve_split = true; # You probably want this
};

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
master = {
  new_status = "master";
};

# https://wiki.hyprland.org/Configuring/Variables/#misc
misc = {
  force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
  disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background :(
};


##############
### INPUTS ###
##############

# TODO: figure out how this sections interacts with nixos options


###################
### KEYBINDINGS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/
"$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

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
  "$mainMod SHIFT, R, exec, $menu_full"
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
  "$mainMod SHIFT, H, swapwindow, l"
  "$mainMod SHIFT, L, swapwindow, r"
  "$mainMod SHIFT, K, swapwindow, u"
  "$mainMod SHIFT, J, swapwindow, d"

  # Switch workspasces with mainMod + [0-9]
  "$mainMod, 1, workspace, 1"
  "$mainMod, 2, workspace, 2"
  "$mainMod, 3, workspace, 3"
  "$mainMod, 4, workspace, 4"
  "$mainMod, 5, workspace, 5"
  "$mainMod, 6, workspace, 6"
  "$mainMod, 7, workspace, 7"
  "$mainMod, 8, workspace, 8"
  "$mainMod, 9, workspace, 9"
  "$mainMod, 0, workspace, 10"

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
  "$mainMod, y, workspace, 1"
  "$mainMod, u, workspace, 2"
  "$mainMod, i, workspace, 3"
  "$mainMod, o, workspace, 4"
  "$mainMod, p, workspace, 5"

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


##############################
### WINDOWS AND WORKSPACES ###
##############################

# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

# Example windowrule v1
# windowrule = "float, ^(kitty)$";


# Example windowrule v2
# windowrulev2 = "float, class:^(kitty)$,title:^(kitty)$";

windowrulev2 = [
  # Ignore maximize requests from apps. You'll probably like this.
  "suppressevent maximize, class:.*"

  # Fix some dragging issues with XWayland
  "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
];
}
