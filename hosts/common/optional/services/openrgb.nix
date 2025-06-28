{ pkgs, ... }: {
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.user.services.set_rgb = {
    script = ''
      ${pkgs.openrgb} --mode static --color white
    '';
    partOf = [ "openrgb.service" ];
  };
}
