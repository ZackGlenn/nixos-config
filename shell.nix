{
  pkgs ?
    # If pkgs is not defined, instantiate it from the locked nixpkgs commit
    let
      lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
      nixpkgs = fetchTarball {
        url = "https://github.com/nixos/nixpkgs//archive/${lock.rev}".tar.gz;
        sha256 = lock.narHash;
      };
    in
    import nixpkgs { }
}:

{
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";

    nativeBuildInputs = builtins.attrValues {
      inherit (pkgs)

        nix
        git
        sops
        age
        ssh-to-age
        openssh
        ;
    };
  };
}
