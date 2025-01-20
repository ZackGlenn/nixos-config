{...}:
{
programs.fish = {
  enable = true;
  shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/nixos-config/";
    nfu = "nix flake update ~/nixos-config";
  };
  interactiveShellInit = "
    set fish_greeting # Disable greeting
  ";
};
}

