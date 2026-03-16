{ ... }:
{
  programs.waybar.settings = {
    mainBar."custom/launcher".on-click = "sleep 0.1 && niri msg action spawn -- $(tofi-drun)";
  };
}
