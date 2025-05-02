{ config, ... }: {
  sops.secrets = {
    "syncthing_keys/laptop" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  services.syncthing = {
    enable = true;
    user = "zack";
    openDefaultPorts = true;
    key = "${config.sops.secrets."syncthing_keys/laptop".path}";
    cert = "./cert.pem";

    settings = {
      devices = {
        "phone" = { id = "YSGEWCQ-N2XFQMW-ULNQJZ6-DMHIA4K-G6RDIBT-MCIE6SM-4TPXIRO-PCJ3ZAG"; };
      };
      folders = {
        "TheVault" = {
          path = "/home/zack/Sync/TheVault/";
          devices = [ "phone" ];
        };
        "Passwords" = {
          path = "/home/zack/Sync/Passwords/";
          devices = [ "phone" ];
        };
      };
      
      options = {
        urAccepted = -1;
      };
    };
  };
}

