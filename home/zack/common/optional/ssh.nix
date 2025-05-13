{ config, ... }: {
  sops.templates."extra_ssh_config" = {
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
  };

  programs.ssh.includes = [ "${config.sops.templates."extra_ssh_config".path}" ];
}
