{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adapta-gtk-theme;
      name = "Adapta-Dark";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrainsMono";
      size = 11;
    };
    gtk4.theme = config.gtk.theme;
  };
}
