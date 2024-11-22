{pkgs, ...}:
{
home.packages = [
  (pkgs.writeShellApplication {
    name = "powermenu";
    text = "${builtins.readFile ./powermenu.sh}";
  })
];
}
