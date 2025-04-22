{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input.General = {
      ClassicBondedOnly = false; # fixes pairing problem with keyboard
    };
  };
}
