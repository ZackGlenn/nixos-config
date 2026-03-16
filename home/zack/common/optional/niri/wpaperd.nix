{ ... }:
{
  services.wpaperd = {
    enable = true;
    settings = {
      any = {
        path = "/home/zack/Pictures/wallpapers";
        duration = "5m";
      };
    };
  };
}
