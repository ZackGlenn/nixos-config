{writeShellApplication}:
writeShellApplication {
  name = "powermenu";
  text = "${builtins.readFile ./powermenu.sh}";
}
