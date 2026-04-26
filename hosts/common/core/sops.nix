{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      # this will use an age key that is expected to already be in the filesystem
      keyFile = "/var/lib/sops-nix/key.txt";
    };

    # secrets will be output to /run/secrets
    # e.g. /run/secrets/msmptp-password
    # secrets required for user creation are handled in respective ./users/<username>.nix files
    # because they will be output to /run/secrets/secrets-for-users and only when the user is assigned to a host.
    secrets = {
      dynu-password = { };
    };
  };
}
