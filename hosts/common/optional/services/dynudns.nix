{ config, ... }: {
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
    script = "#!/bin/sh
echo url=\"https://api.dynu.com/nic/update?Emerald101&password=${builtins.readFile config.sops.secrets.dynu-password.path}\" | curl -k -";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
