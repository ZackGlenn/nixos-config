{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    nautilus
  ];

  programs.niri = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
