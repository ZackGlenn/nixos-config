{ pkgs, ...}:
pkgs.writeShellApplication {
  name = "hyprpass";
  text = "${builtins.readFile ./hyprpass.sh}";
}
