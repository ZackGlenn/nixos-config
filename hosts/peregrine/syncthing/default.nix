{ config, ... }: {
  sops.secrets = {
    "syncthing_keys/peregrine" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  services.syncthing = {
    enable = true;
    user = "zack";
    openDefaultPorts = true;
    key = "${config.sops.secrets."syncthing_keys/peregrine".path}";
    cert = "./cert.pem";

    settings = {
      devices = {
        "laptop" = { id = "VWFAZFR-6B5QHHH-NMXYXXN-W4VXUBL-L3SKGKY-AZJPGQQ-45K47GN-4Y3CVQJ"; };
        "phone" = { id = "YSGEWCQ-N2XFQMW-ULNQJZ6-DMHIA4K-G6RDIBT-MCIE6SM-4TPXIRO-PCJ3ZAG"; };
        "pi" = { id = "BFA6X4Z-IQR3XPT-7YFFU6U-VYZEBOS-2F7FANY-XN5Q3SR-4HGPBQJ-4Q452QD"; };
      };
      folders = {
        "TheVault" = {
          path = "/home/zack/Sync/TheVault/";
          devices = [ "laptop" "phone" "pi"];
        };
        "Passwords" = {
          path = "/home/zack/Sync/Passwords/";
          devices = [ "laptop" "phone" "pi" ];
        };
      };
      
      options = {
        urAccepted = -1;
      };
    };
  };
}

