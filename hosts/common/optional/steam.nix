{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = [ pkgs.mangohud ];
  programs.gamemode.enable = true;
}
