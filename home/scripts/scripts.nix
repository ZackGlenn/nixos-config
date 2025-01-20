{pkgs, ...}:
{
home.packages = [
  (pkgs.writeShellApplication {
    name = "powermenu";
    text = "${builtins.readFile ./powermenu.sh}";
  })

  (pkgs.writeShellApplication {
      name = "hyprpass";
      text = "${builtins.readFile ./hyprpass.sh}";
  })
];
}
