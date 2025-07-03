#
# ========= Laptop - Main Machine =========
#
{inputs, ...}: {
  imports = [
    # ========= Hardware Modules =========
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    # ========= Required Configs =========
    ../common/core
    ./hardware-configuration.nix

    # ========= Host-specific Optional Configs =========
    ../common/optional/services/pipewire.nix
    ../common/optional/services/openssh.nix
    ../common/optional/services/mySync.nix
    ../common/optional/hyprland.nix
    ../common/optional/ydotool.nix
    ../common/optional/bluetooth.nix
    ../common/optional/hyprlock.nix
    ../common/optional/sddm.nix
    ../common/optional/fonts.nix
    ../common/optional/git.nix
    ../common/optional/networkmanager.nix
    ../common/optional/ssh.nix
    ../common/optional/steam.nix

    # ========= Host-unique Configs =========
    # ./nvidia.nix

    # ========= Users to Create =========
    ../common/users/zack
  ];

  mySync = {
    hostName = "laptop";
    user = "zack";
    sync_to = [ "phone" "peregrine" "pi" ];
  };

  networking = {
    hostName = "laptop";
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # allow emulated cross-compilation
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

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
