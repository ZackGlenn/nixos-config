{writeShellApplication}:
(writeShellApplication {
  name = "hyprpass";
  text = "${builtins.readFile ./hyprpass.sh}";
})
