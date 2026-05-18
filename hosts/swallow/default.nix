#
# ========= Pi - Tiny Home Server =========
#
{ inputs, pkgs, ... }:
{
  imports = with inputs.nixos-raspberrypi.nixosModules; [
    # ========= Hardware Modules =========
    raspberry-pi-4.base
    usb-gadget-ethernet

    # ========= Required Configs =========
    ../common/core
    ./hardware-configuration.nix

    # ========= Host-specific Optional Configs =========
    ../common/optional/services/openssh.nix
    ../common/optional/services/dynudns.nix
    ../common/optional/services/audiobookshelf.nix
    ../common/optional/services/mySync.nix
    ../common/optional/fonts.nix
    ../common/optional/git.nix
    ../common/optional/networkmanager.nix

    # ========= Host-unique Configs =========

    # ========= Users to Create =========
    ../common/users/zack
  ];

  mySync = {
    hostName = "swallow";
    user = "zack";
    sync_to = [
      "phone"
      "laptop"
      "peregrine"
    ];
  };

  networking = {
    hostName = "swallow";
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 1 * 1024; # 1GB
    }
  ];

  environment.systemPackages = [ pkgs.libraspberrypi ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
