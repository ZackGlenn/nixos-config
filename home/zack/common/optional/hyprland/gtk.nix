{ pkgs, ... }: {
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
};
}
