{pkgs, inputs, config, ... }: {
  # Decrypt zack-password to /run/secrets-for-users/ so it can be used to create the user
  sops.secrets.zack-password.neededForUsers = true;
  users.mutableUsers = false; # Required for password to be set via sops during system activation!

  users.users.zack = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.zack-password.path;
    description = "Zack Glenn";
    # TODO: figure out if this is the right way to handle the ydotool group
    extraGroups = [ "networkmanager" "wheel" "ydotool" ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/id_zack.pub)
    ];
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.zack = import ../../../../home/zack/${config.networking.hostName}.nix;
}
