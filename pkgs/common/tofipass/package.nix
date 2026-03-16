{ writeShellApplication }:
(writeShellApplication {
  name = "tofipass";
  text = "${builtins.readFile ./tofipass.sh}";
})
