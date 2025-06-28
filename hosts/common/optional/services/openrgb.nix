{ pkgs, ... }: {
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.services.set_rgb = {
    script = ''
      ${pkgs.openrgb}/bin/openrgb --mode static --color DDF9F1
    '';
  wantedBy = [ "multi-user.target" ];
  after = ["openrgb.service"];
  };
}
