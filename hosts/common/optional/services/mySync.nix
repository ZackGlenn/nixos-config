{ lib, config, ... }:
{

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

  config =
    let
      inherit (config.mySync) hostName user sync_to;
      devices = {
        "laptop" = {
          id = "VWFAZFR-6B5QHHH-NMXYXXN-W4VXUBL-L3SKGKY-AZJPGQQ-45K47GN-4Y3CVQJ";
        };
        "phone" = {
          id = "YSGEWCQ-N2XFQMW-ULNQJZ6-DMHIA4K-G6RDIBT-MCIE6SM-4TPXIRO-PCJ3ZAG";
        };
        "swallow" = {
          id = "IP7Q2D7-E46BDFO-SGRDNRX-A5JUDHU-2ALZLO7-HQ663GM-3L6XHAY-JFPDBQZ";
        };
        "peregrine" = {
          id = "OCY27KI-W4N54S3-46UDTX6-WILSTJA-DHTLGS7-FVIHL5T-HC3CJRC-J2W6CQ5";
        };
      };
    in
    {
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
              ignorePatterns = [
                ".obsidian/workspace.json"
                ".obsidian/workspace-mobile.json"
              ];
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
