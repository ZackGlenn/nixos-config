{ inputs, hostName, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the zack/dev key and needs to have been copied to this location on this host
    age.keyFile = "/home/zack/.config/sops/age/keys.txt";

    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/zack" = {
        path = "/home/zack/.ssh/id_zack";
      };
    };
  };
}
