{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    theme = "tokyo-night";
  };

  environment.systemPackages = [ pkgs.tokyo-night-sddm ];
}
