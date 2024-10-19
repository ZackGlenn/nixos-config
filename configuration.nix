# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # home manager
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Swap file
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Disable mac address randomization
  networking.networkmanager.wifi.scanRandMacAddress = false;

  # Enable bluetooth and blueman
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input.General.ClassicBondedOnly = false;
  };
  services.blueman.enable = true;

  # Enable pipewire
  services.pipewire.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # xserver settings
  services.xserver = {
    enable = true;
    dpi = 220;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:swapescape";
    };
  };

  # Enable greetd and  ReGreet
  services.greetd = {
    enable = true;
    # settings.default_session = {
    #   command = "Hyprland";
    #   user = "zack";
    # };
  };
  programs.regreet.enable = true;

  # Enable hyprland
  programs.hyprland.enable = true;

  # Have Electron apps use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zack = {
    isNormalUser = true;
    description = "Zack Glenn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Home manager config
  home-manager.users.zack = { pkgs, ... }: {
    home.packages = with pkgs; [qutebrowser joshuto ripgrep bat];
    programs.fish.enable = true;
    programs.kitty.enable = true;

    # Configure hyprland
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.settings = import ./hyprland.nix;

    # state version is required and should stay at the initial version
    home.stateVersion = "24.05";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    kitty
  ];

  # enable neovim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # enable git and lazygit
  programs.git.enable = true;
  programs.git.config = {
    user = {
      name = "Zack Glenn";
      email = "ZackGlenn05@gmail.com";
    };
  };
  programs.lazygit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
