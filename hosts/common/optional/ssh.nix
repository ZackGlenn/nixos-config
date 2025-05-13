{ config, ... }: {
  sops.secrets = {
    "my-domain" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  programs.ssh = {
    knownHosts = {
      pi = {
        hostNames = [ "192.168.4.11" "${builtins.readFile config.sops.secrets.my-domain.path}" ];
        publicKey = "sh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0 root@raspberrypi";
      };
    };
  };
}
