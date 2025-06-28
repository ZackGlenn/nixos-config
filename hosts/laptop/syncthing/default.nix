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
        "pi" = { id = "BFA6X4Z-IQR3XPT-7YFFU6U-VYZEBOS-2F7FANY-XN5Q3SR-4HGPBQJ-4Q452QD"; };
        "peregrine" = { id = "3IOF6JH-MGDQY2H-XRWWJGM-P5MNGY6-H46HF3N-VJAFP6W-IE4TZUQ-MZ7XFAK"; };
      };
      folders = {
        "TheVault" = {
          path = "/home/zack/Sync/TheVault/";
          devices = [ "phone" "pi" "peregrine" ];
        };
        "Passwords" = {
          path = "/home/zack/Sync/Passwords/";
          devices = [ "phone" "pi" "peregrine" ];
        };
      };
      
      options = {
        urAccepted = -1;
      };
    };
  };
}

