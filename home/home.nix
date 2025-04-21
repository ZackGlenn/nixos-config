  # Home manager config
{config, lib, pkgs, ... }:
{
  imports = [
    ./nvim/nvim.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./waybar/waybar.nix
    ./lazygit.nix
    ./fish.nix
    ./scripts/scripts.nix
    ./hyprland.nix
  ];

  home.packages = with pkgs; [
    bat
    ripgrep
    lxqt.lxqt-policykit
    clipse
    brightnessctl
    pavucontrol
    dust
    tldr
    cowsay
    cmatrix
    asciiquarium
    neofetch
    blueman
    swaylock
    hyprcursor
    keepassxc
    obsidian
    typst
    zathura
    webcord
    wev
    playerctl
    rink
    wl-kbptr
    wlrctl
    zip
    unzip
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  programs.tofi = {
    enable = true;
    settings = {
      terminal = "kitty";
      width = "100%";
      height = "100%";
      border-width = "0";
      outline-width = "0";
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = "25";
      num-results = "5";
      font = "JetBrainsMono";
      background-color = "#000A";
    };
  };

  programs.btop = {
    enable = true;
    settings.color_theme = "tokyo-night";
  };

  programs.joshuto = {
    enable = true;
    settings = {
      use_trash = false;
    };
  };

  services = {
    dunst.enable = true;
    playerctld.enable = true;
  };

  home.activation = {
  # Workaround for tofi not recognizing changes to .desktop files
  # See https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
  regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    tofi_cache=${config.xdg.cacheHome}/tofi-drun
    [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
  '';
  };

  # state version is required and should stay at the initial version
  home.stateVersion = "24.05";
}
