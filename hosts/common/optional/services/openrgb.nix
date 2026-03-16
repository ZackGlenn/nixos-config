{ pkgs, ... }:
{
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.services.start_rgb = {
    wantedBy = [
      "multi-user.target"
    ];
    requires = [ "openrgb.service" ];
    after = [ "openrgb.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
      ExecStart = "${pkgs.openrgb}/bin/openrgb --mode static --brightness 30 --color 7aa2f7";
    };
  };

  # powerManagement.resumeCommands = "${pkgs.openrgb}/bin/openrgb --mode static --brightness 30 --color 7aa2f7";
  powerManagement.resumeCommands = ''
    systemctl restart openrgb
    sleep 5
    ${pkgs.openrgb}/bin/openrgb --mode static --brightness 30 --color 7aa2f7
  '';
}
