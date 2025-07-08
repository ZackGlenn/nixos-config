{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.linux-firmware ];
  services.fwupd.enable = true;
}
