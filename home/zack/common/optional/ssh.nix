{ config, ... }: {
  sops.secrets = {
    "my-domain" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  sops.templates."/home/zack/.ssh/config" = {
    content = ''
      Host pi
        User pi
        HostName 192.168.4.11
        Port 2211
        IdentityFile ~/.ssh/id_laptop

      Host pi-remote
        User pi
        HostName ${config.sops.my-domain}
        Port 2211
        IdentityFile ~/.ssh/id_laptop
    '';
    owner = "zack";
  };
}
