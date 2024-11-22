{pkgs, pkgs-unstable, ...}:

{
programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = "
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./gitsigns.lua}
      ${builtins.readFile ./which_key.lua}
      ${builtins.readFile ./conform.lua}
      ${builtins.readFile ./cmp.lua}
      ${builtins.readFile ./todo_comments.lua}
      ${builtins.readFile ./mini.lua}
      ${builtins.readFile ./treesitter.lua}
      ${builtins.readFile ./telescope.lua}
      ${builtins.readFile ./lsp.lua}
      ${builtins.readFile ./toggleterm.lua}
      ${builtins.readFile ./aerial.lua}
      ${builtins.readFile ./ibl.lua}
    ";

    plugins = with pkgs.vimPlugins; [
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
        p.markdown
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
      nodePackages.bash-language-server
    ];
};
}
