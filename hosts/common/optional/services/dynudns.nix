{ config, pkgs, ... }: {
  sops.secrets = {
    "dynu-password" = {
      owner = config.users.users.zack.name;
      inherit (config.users.users.zack) group;
    };
  };

  systemd.timers."ip-update" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "ip-update.service";
    };
  };

  systemd.services."ip-update" = {
    script = "#!/usr/bin/env bash
password=$(cat ${config.sops.secrets.dynu-password.path})
${pkgs.curl}/bin/curl -k \"https://api.dynu.com/nic/update?username=Emerald101&password=$password\"";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
