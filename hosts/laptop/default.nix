#
# ========= Laptop - Main Machine =========
#
{inputs, ...}: {
  imports = [
    # ========= Hardware Modules =========
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    # ========= Required Configs =========
    ../common/core
    ./hardware-configuration.nix

    # ========= Host-specific Optional Configs =========
    ../common/optional/hyprland.nix
    ../common/optional/ydotool.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/bluetooth.nix
    ../common/optional/swaylock.nix
    ../common/optional/sddm.nix
    ../common/optional/jetbrainsmono.nix
    ../common/optional/git.nix
    ../common/optional/networkmanager.nix
    ../common/optional/services/openssh.nix

    # ========= Host-unique Configs =========
    ./syncthing

    # ========= Users to Create =========
    ../common/users/zack
  ];

  networking = {
    hostName = "laptop";
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
