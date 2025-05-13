{ config, ... }: {
  sops.secrets = {
    "my-domain" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  sops.templates."declared_known_hosts".content = ''
    pi ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0
    pi-remote ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0
    192.168.4.11 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0
    ${config.sops.secrets.my-domain} ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0
    '';

  programs.ssh.knownHostsFiles = ["${config.sops.templates."declared_known_hosts".path}"];
}
