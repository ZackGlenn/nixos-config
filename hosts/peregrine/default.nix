#
# ========= Laptop - Main Machine =========
#
{ inputs, pkgs, ... }:
{
  imports = [
    # ========= Hardware Modules =========
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.gigabyte-b650

    # ========= Required Configs =========
    ../common/core
    ./hardware-configuration.nix

    # ========= Host-specific Optional Configs =========
    ../common/optional/services/pipewire.nix
    ../common/optional/services/udisks2.nix
    ../common/optional/services/openrgb.nix
    ../common/optional/services/mySync.nix
    # ../common/optional/hyprlock.nix
    # ../common/optional/hyprland.nix
    ../common/optional/niri.nix
    ../common/optional/ydotool.nix
    ../common/optional/bluetooth.nix
    ../common/optional/sddm.nix
    ../common/optional/fonts.nix
    ../common/optional/git.nix
    ../common/optional/networkmanager.nix
    ../common/optional/ssh.nix
    ../common/optional/steam.nix

    # ========= Users to Create =========
    ../common/users/zack
  ];

  mySync = {
    hostName = "peregrine";
    user = "zack";
    sync_to = [
      "phone"
      "laptop"
      "pi"
    ];
  };

  networking = {
    hostName = "peregrine";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # allow emulated cross-compilation
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
