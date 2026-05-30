{ config, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:2:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "580.159.03";
      sha256_64bit = "sha256-MshdmbD2QMlQH2GzndrSCP0CiNAVxPvF/QQ1wHeD+nc=";
      sha256_aarch64 = lib.fakeSha256;
      openSha256 = lib.fakeSha256;
      settingsSha256 = "sha256-kP3J87uUVPOOJHmTdRNm4+GdIyniZYrtgehrYSXcX9A=";
      persistencedSha256 = lib.fakeSha256;
    };
  };
}
