{ ... }:
{
  programs.waybar.settings = {
    mainBar = {
      modules-left = [ "hyprland/workspaces" ];
      "custom/launcher".on-click = "sleep 0.1 && tofi-drun | xargs hyprctl dispatcher exec --";
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
    };
  };
}
