{writeShellApplication}:
(writeShellApplication {
  name = "bluetoggle";
  text = "${builtins.readFile ./bluetoggle.sh}";
})
