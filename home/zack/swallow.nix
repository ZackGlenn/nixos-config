{...}:
{
  imports = [
    # ========= Required Configs =========
    ./common/core

    # ========= Host-specific Optional Configs =========
    ./common/optional/cli-fun.nix
    ./common/optional/lazygit.nix
    ./common/optional/rink.nix
    ./common/optional/sops.nix
  ];
}

