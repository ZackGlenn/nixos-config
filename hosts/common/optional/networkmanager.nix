{...}: {
  networking.networkmanager = {
    enable = true;
    wifi.scanRandMacAddress = false;
  };
}
