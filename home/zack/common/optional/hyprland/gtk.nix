{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
    gtk4.theme = config.gtk.theme;
  };
}
