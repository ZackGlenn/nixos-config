{pkgs, inputs, config, ... }: {
  users.users.zack = {
    isNormalUser = true;
    description = "Zack Glenn";
    # TODO: figure out if this is the right way to handle the ydotool group
    extraGroups = [ "networkmanager" "wheel" "ydotool" ];
  };

  packages = [ pkgs.home-manager ];

  home-manager.users.ta = import ../../../../home/zack/${config.networking.hostname}.nix;
}
