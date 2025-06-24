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
        "peregrine" = { id = "MHFOPMG-NIAIGPT-D3WHEDX-IRZAIA5-IBI73W2-M27AT6X-YAZ7FFI-UQELUAE"; };
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

