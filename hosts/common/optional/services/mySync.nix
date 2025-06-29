{ lib, config, ... }: {

  options.mySync = {
    hostName = lib.mkOption {
      type = lib.types.str;
    };

    user = lib.mkOption {
      type = lib.types.str;
    };

    sync_to = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
  };

  config = let
    inherit (config.mySync) hostName user sync_to;
    devices = {
      "laptop" = { id = "VWFAZFR-6B5QHHH-NMXYXXN-W4VXUBL-L3SKGKY-AZJPGQQ-45K47GN-4Y3CVQJ"; };
      "phone" = { id = "YSGEWCQ-N2XFQMW-ULNQJZ6-DMHIA4K-G6RDIBT-MCIE6SM-4TPXIRO-PCJ3ZAG"; };
      "pi" = { id = "BFA6X4Z-IQR3XPT-7YFFU6U-VYZEBOS-2F7FANY-XN5Q3SR-4HGPBQJ-4Q452QD"; };
      "peregrine" = { id = "OCY27KI-W4N54S3-46UDTX6-WILSTJA-DHTLGS7-FVIHL5T-HC3CJRC-J2W6CQ5"; };
    };
  in {
    sops.secrets = {
      "syncthing_certs/${hostName}" = {
        owner = config.users.users.${user}.name;
        inherit (config.users.users.${user}) group;
      };
      "syncthing_keys/${hostName}" = {
        owner = config.users.users.${user}.name;
        inherit (config.users.users.${user}) group;
      };
    };

    services.syncthing = {
      inherit user;
      enable = true;
      openDefaultPorts = true;
      dataDir = "/home/${user}/Sync";
      configDir = "/home/${user}/.config/syncthing";

      cert = "${config.sops.secrets."syncthing_certs/${hostName}".path}";
      key = "${config.sops.secrets."syncthing_keys/${hostName}".path}";

      settings = {
        devices = lib.filterAttrs (n: v: n != hostName) devices;

        folders = {
          "TheVault" = {
            devices = sync_to;
            path = "/home/zack/Sync/TheVault/";
          };
          "Passwords" = {
            devices = sync_to;
            path = "/home/zack/Sync/Passwords/";
          };
        };

        options = {
          urAccepted = -1;
        };
      };
    };
  };
}
