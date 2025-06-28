{ pkgs, ... }: {
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.services.set_rgb = {
    script = ''
      ${pkgs.openrgb}/bin/openrgb --mode static --color white
    '';
  wantedBy = [ "multi-user.target" ];
  after = ["openrgb.service"];
  };
}
