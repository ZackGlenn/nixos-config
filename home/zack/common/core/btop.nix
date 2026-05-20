{ pkgs, osConfig, ... }:
{
  programs.btop = {
    enable = true;
    settings.color_theme = "tokyo-night";
    package =
      {
        "peregrine" = pkgs.btop-rocm;
        "laptop" = pkgs.btop-cuda;
      }
      ."${osConfig.networking.hostName}" or pkgs.btop;
  };
}
