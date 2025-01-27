{...}:
{
programs.waybar = {
  enable = true;
  systemd.enable = true;
  style = "
    ${builtins.readFile ../style/tokyonight.css}
    ${builtins.readFile ./style.css}
  ";
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      modules-left = [
        "custom/launcher"
        "idle_inhibitor"
        "tray"
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "bluetooth"
        "network"
        "backlight"
        "pulseaudio"
        "battery"
        "custom/powermenu"
      ];
      "custom/launcher" = {
        format = "";
        on-click = "sleep 0.1 && tofi-drun | xargs hyprctl dispatcher exec --";
      };
      "hyprland/workspaces" = {
        all-outputs = true;
        active-only = true;
        show-special = true;
        format = "{icon}";
        format-icons = {
          "1" = "󰲠";
          "2" = "󰲢";
          "3" = "󰲤";
          "4" = "󰲦";
          "5" = "󰲨";
          "6" = "󰲪";
          "7" = "󰲬";
          "8" = "󰲮";
          "9" = "󰲰";
          "10" = "󰿬";
          special = "󰰢";
        };
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          deactivated = "";
          activated = "";
        };
        tooltip = false;
      };
      backlight = {
        on-scroll-up = "brightnessctl s 10%+";
        on-scroll-down = "brightnessctl s 10%-";
        format = "{icon} {percent}%";
        format-icons = [
          "󰃚"
          "󰃛"
          "󰃜"
          "󰃝"
          "󰃞"
          "󰃟"
          "󰃠"
        ];
      };
      disk = {
        interval = 30;
        format = " {used}";
        tooltip = true;
        on-click = "sleep 0.1 && kitty dust";
        tooltip-format = "{used}/{total} => {path} {percentage_used}%";
      };
      pulseaudio = {
        scroll-step = 1;
        format = "{icon} {volume}%";
        format-muted = "󰝟 Muted";
        format-icons = {
          default = [
            ""
            ""
            "󰕾"
          ];
        };
        on-click = "sleep 0.1 && wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        tooltip = false;
      };
      battery = {
        interval = 10;
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{icon} {capacity}%";
        format-icons = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󱟢"
        ];
        format-full = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        tooltip = true;
      };
      clock = {
        interval = 1;
        format = "<span foreground='#9ECE6A'>󰥔 </span> {:%H:%M  %A %b %d}";
        tooltip = true;
        tooltip-format = "{:%A, %d %B %Y}\n<tt>{calendar}</tt>";
        calendar = {
          format = {
            months = "<span color='#BB9AF7'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
      };
      memory = {
        on-click = "sleep 0.1 && kitty btop";
        interval = 1;
        format = " {used}";
        states = {
          warning = 85;
        };
      };
      cpu = {
        interval = 1;
        format = " {usage}%";
      };
      network = {
        interval = 1;
        format-wifi = "󰖩 {essid}";
        format-ethernet = "󰈀  {ifname} ({ipaddr})";
        format-linked = "󰲊 {essid} (No IP)";
        format-disconnected = "󰖪 Disconnected";
        on-click = "sleep 0.1 && kitty nmtui";
        tooltip = true;
      };
      bluetooth = {
        format = " {status}";
        format-disabled = ""; # an empty format will hide the module
        format-connected = "  {num_connections}";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        on-click = "sleep 0.1 && blueman-manager";
      };
      temperature = {
        critical-threshold = 80;
        tooltip = false;
        format = " {temperatureC}°C";
      };
      "custom/powermenu" = {
        format = "";
        # TODO: powermenu
        on-click = "sleep 0.1 && /home/narmis/.config/rofi/powermenu/type-1/powermenu.sh";
        tooltip = false;
      };
      tray = {
        icon-size = 15;
        spacing = 5;
      };
    };
  };
};
}
