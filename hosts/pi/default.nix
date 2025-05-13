#
# ========= Pi - Tiny Home Server =========
#
{ inputs, pkgs, ... }: {
  imports = [
    # ========= Hardware Modules =========
    inputs.hardware.nixosModules.raspberry-pi-4

    # ======== Disk Layout =========
    inputs.disko.nixosModules.disko
    ./disks.nix

    # ========= Required Configs =========
    ../common/core
    ./hardware-configuration.nix

    # ========= Host-specific Optional Configs =========
    ../common/optional/jetbrainsmono.nix
    ../common/optional/git.nix
    ../common/optional/networkmanager.nix
    ../common/optional/services/openssh.nix
    ../common/optional/services/dynudns.nix
    ../common/optional/services/audiobookshelf.nix

    # ========= Host-unique Configs =========
    ./syncthing

    # ========= Users to Create =========
    ../common/users/zack
  ];

  networking = {
    hostName = "pi";
  };

  swapDevices = [{
    device = "/swapfile";
    size = 8 * 1024; # 8GB
  }];

  environment.systemPackages = [ pkgs.libraspberrypi ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

