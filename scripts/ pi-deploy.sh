#!/usr/bin/env bash

nix run github:nix-community/nixos-anywhere -- \
  --kexec "$(nix build --print-out-paths github:nix-community/nixos-images\#packages.aarch64-linux.kexec-installer-nixos-unstable-noninteractive)/nixos-kexec-installer-noninteractive-aarch64-linux.tar.gz" \
  --copy-host-keys \
  --extra-files ./pi-files \
  --generate-hardware-config nixos-generate-config ./hosts/pi/hardware-configuration.nix \
  --flake 'github:ZackGlenn/nixos-config#pi' \
  -i ~/.ssh/id_laptop \
  -p 2211 \
  root@raspberrypi
