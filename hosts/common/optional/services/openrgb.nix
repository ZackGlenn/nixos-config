{...}: {
  services.hardware.openrgb = {
    enable = true;
  };

  systemd.user.services.set_rgb = {
    script = ''
      openrbg --color white
    '';
    partOf = [ "openrbg.service" ];
  };
}
