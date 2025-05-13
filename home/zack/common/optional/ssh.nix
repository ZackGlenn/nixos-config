{ config, ... }: {

  sops.templates."/home/zack/.ssh/config" = {
    content = ''
      Host pi
        User pi
        HostName 192.168.4.11
        Port 2211
        IdentityFile ~/.ssh/id_laptop

      Host pi-remote
        User pi
        HostName ${config.sops.secrets.my-domain}
        Port 2211
        IdentityFile ~/.ssh/id_laptop
    '';
    owner = "zack";
  };
}
