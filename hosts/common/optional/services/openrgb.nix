{ pkgs, ... }: {
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.services.set_rgb = {
    script = ''
      ${pkgs.openrgb}/bin/openrgb --mode static --brightness 30 --color 7aa2f7
    '';
  wantedBy = [ "multi-user.target" ];
  after = ["openrgb.service"];
  };
}
