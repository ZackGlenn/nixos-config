  # Home manager config
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    ripgrep
    joshuto
    qutebrowser
    fish
    lxqt.lxqt-policykit
    clipse
    brightnessctl
    pavucontrol
  ];

  programs.kitty = {
    enable = true;
    settings.confirm_os_window_close = 0;
  };

  programs.tofi = {
    enable = true;
    settings.terminal = "kitty";
  };

  program.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = "${builtins.readFile ./nvim/init.lua}";

    plugins = with pkgs.vimPlugins; [
      vim-sleuth
      gitsigns-nvim
      which-key-nvim
      neodev-nvim
      nvim-lspconfig
      conform-nvim
      nvim-cmp
      tokyonight-nvim
      todo-comments-nvim
      mini-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      cmp-nvim-lsp
      fidget-nvim
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path

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
      ]))
    ];
  };

  services.dunst.enable = true;
  services.playerctld.enable = true;

  # Configure hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = import ./hyprland.nix;


  # state version is required and should stay at the initial version
  home.stateVersion = "24.05";
}
