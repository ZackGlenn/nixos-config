{ config, ... }: {
  sops.templates."extra_ssh_config" = {
    content = ''
      Host pi
        User pi
        HostName 192.168.4.11
        Port 2211
        IdentityFile ~/.ssh/id_zack

      Host pi-remote
        User pi
        HostName ${config.sops.placeholder.my-domain}
        Port 2211
        IdentityFile ~/.ssh/id_zack
    '';
  };

  programs.ssh.includes = [ "${config.sops.templates."extra_ssh_config".path}" ];

  programs.ssh.matchBlocks = {
    pi = {
      user = "pi";
      hostn
    }
  }
}
