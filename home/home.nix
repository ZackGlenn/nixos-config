  # Home manager config
{config, lib, pkgs, pkgs-unstable, ... }:
{

  home.packages = with pkgs; [
    bat
    ripgrep
    joshuto
    fish
    lxqt.lxqt-policykit
    clipse
    brightnessctl
    pavucontrol
    btop
  ];

  programs.kitty = import ./kitty.nix;
  programs.qutebrowser = import ./qutebrowser.nix;

  programs.tofi = {
    enable = true;
    settings.terminal = "kitty";
  };

  programs.waybar = import ./waybar/waybar.nix;

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = "
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}
      ${builtins.readFile ./nvim/gitsigns.lua}
      ${builtins.readFile ./nvim/which_key.lua}
      ${builtins.readFile ./nvim/conform.lua}
      ${builtins.readFile ./nvim/cmp.lua}
      ${builtins.readFile ./nvim/todo_comments.lua}
      ${builtins.readFile ./nvim/mini.lua}
      ${builtins.readFile ./nvim/treesitter.lua}
      ${builtins.readFile ./nvim/telescope.lua}
      ${builtins.readFile ./nvim/lsp.lua}
      ${builtins.readFile ./nvim/toggleterm.lua}
      ${builtins.readFile ./nvim/aerial.lua}
      ${builtins.readFile ./nvim/ibl.lua}
    ";

    plugins = with pkgs.vimPlugins; [
      vim-sleuth
      gitsigns-nvim
      which-key-nvim
      nvim-lspconfig
      conform-nvim
      nvim-cmp
      tokyonight-nvim
      todo-comments-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      cmp-nvim-lsp
      fidget-nvim
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      toggleterm-nvim
      aerial-nvim
      lspkind-nvim
      indent-blankline-nvim

      pkgs-unstable.vimPlugins.lazydev-nvim
      pkgs-unstable.vimPlugins.mini-nvim

      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.lua
        p.rust
        p.python
        p.julia
        p.cpp
        p.bash
        p.fish
        p.toml
        p.yaml
        p.json
        p.query
        p.vimdoc
      ]))
    ];

    extraPackages = with pkgs; [
      lua-language-server
      nil
      stylua
      rust-analyzer
      pyright
    ];
  };

  services.dunst.enable = true;
  services.playerctld.enable = true;

  # Configure hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./hyprland.nix;

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