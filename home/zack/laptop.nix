{...}:
{
  imports = [
    # ========= Required Configs =========
    common/core

    # ========= Host-specific Optional Configs =========
    optional/hyprland
    optional/blueman.nix
    optional/brightnessctl.nix
    optional/cli-fun.nix
    optional/keepassxc.nix
    optional/kitty.nix
    optional/lazygit.nix
    optional/media.nix
    optional/obsidian.nix
    optional/qutebrowser.nix
    optional/rink.nix
    optional/tofi.nix
    optional/typst.nix
    optional/wayland.nix
    optional/webcord.nix
    optional/zathura.nix
  ];
}
