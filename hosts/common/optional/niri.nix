{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    nautilus
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
