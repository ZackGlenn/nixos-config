{...}:
{
programs.fish = {
  enable = true;
  shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/nixos-config/";
    nfu = "nix flake update --flake ~/nixos-config";
  };
  interactiveShellInit = "
    set fish_greeting # Disable greeting
  ";
};
}

