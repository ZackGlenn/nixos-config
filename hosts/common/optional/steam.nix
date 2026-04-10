{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };

  environment.systemPackages = [ pkgs.mangohud ];
  programs.gamemode.enable = true;
  boot.kernelModules = [ "ntsync" ]; # Needed for wine 11.0 improvements
}
