{...}:
{
  imports = [
    # ========= Required Configs =========
    ./common/core

    # ========= Host-specific Optional Configs =========
    ./common/optional/hyprland
    ./common/optional/blueman.nix
    ./common/optional/brightnessctl.nix
    ./common/optional/cli-fun.nix
    ./common/optional/keepassxc.nix
    ./common/optional/kitty.nix
    ./common/optional/lazygit.nix
    ./common/optional/media.nix
    ./common/optional/obsidian.nix
    ./common/optional/qutebrowser.nix
    ./common/optional/rink.nix
    ./common/optional/tofi.nix
    ./common/optional/typst.nix
    ./common/optional/wayland.nix
    ./common/optional/webcord.nix
    ./common/optional/zathura.nix
    ./common/optional/sops.nix
    ./common/optional/youtube.nix
    ./common/optional/chromium.nix
  ];
}
