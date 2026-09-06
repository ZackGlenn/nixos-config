{ inputs, ... }:

let
  additions =
    final: prev:
    (prev.lib.packagesFromDirectoryRecursive {
      callPackage = prev.lib.callPackageWith final;
      directory = ../pkgs/common;
    });

  modifications = final: prev: {
    qutebrowser = prev.qutebrowser.override {
      enableWideVine = true;
    };

    # Remove broken firmware versions to solve Realtek 8852CE wifi interfering with bluetooth
    # Should cause the kernel to load the most recent working version, 0.27.56.14.
    # Check with `sudo dmesg | grep rtw89` soonish after boot
    # See: https://dredyson.com/the-hidden-truth-about-bluetooth-audio-stuttering-during-wifi-activity-on-rtl8852ce-a-complete-expert-analysis-technical-deep-dive-and-proven-workaround-guide-for-linux-users/
    linux-firmware = prev.linux-firmware.overrideAttrs {
      postUnpack = ''
        rm ./source/rtw89/rtw8852c_fw-1.bin ./source/rtw89/rtw8852c_fw-2.bin
        patchShebangs .
      '';
    };
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
      # overlays = [];
    };
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
      # overlays = [];
    };
  };

in
{
  default =
    final: prev:

    (additions final prev)
    // (modifications final prev)
    // (stable-packages final prev)
    // (unstable-packages final prev);
}
