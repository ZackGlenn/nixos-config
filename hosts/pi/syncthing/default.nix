{ config, ... }: {
  sops.secrets = {
    "syncthing_keys/pi" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  services.syncthing = {
    enable = true;
    user = "zack";
    openDefaultPorts = true;
    key = "${config.sops.secrets."syncthing_keys/pi".path}";
    cert = "./cert.pem";

    settings = {
      devices = {
        "phone" = { id = "YSGEWCQ-N2XFQMW-ULNQJZ6-DMHIA4K-G6RDIBT-MCIE6SM-4TPXIRO-PCJ3ZAG"; };
        "laptop" = { id = "VWFAZFR-6B5QHHH-NMXYXXN-W4VXUBL-L3SKGKY-AZJPGQQ-45K47GN-4Y3CVQJ"; };
      };
      folders = {
        "TheVault" = {
          path = "/home/zack/Sync/TheVault/";
          devices = [ "phone" "laptop" ];
        };
        "Passwords" = {
          path = "/home/zack/Sync/Passwords/";
          devices = [ "phone" "laptop" ];
        };
      };
      
      options = {
        urAccepted = -1;
      };
    };
  };
}

