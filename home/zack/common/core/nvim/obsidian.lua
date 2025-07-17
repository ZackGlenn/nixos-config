require("obsidian").setup({
  workspaces = {
    {
      name = "The Vault",
      path = "~/Sync/TheVault",
    },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  new_notes_location = "current_dir",
  disable_frontmatter = true,
  templates = {
    folder = "templates",
  },
  picker = {
    name = "telescope.nvim",
  },
  ui = {
    enable = true,
  },
  legacy_commands = false,
})

vim.keymap.set("n", "<leader>oo", "<Cmd>Obsidian open<CR>", { desc = "[O]pen in [O]bsidian" })
vim.keymap.set("n", "<leader>os", "<Cmd>Obsidian search<CR>", { desc = "[O]bsidian [s]earch" })
vim.keymap.set("n", "<leader>of", "<Cmd>Obsidian follow_link<CR>", { desc = "[O]bsidian [f]ollow link" })
vim.keymap.set("n", "<leader>ob", "<Cmd>Obsidian backlinks<CR>", { desc = "[O]bsidian [b]acklinks" })
vim.keymap.set("n", "<leader>ot", "<Cmd>Obsidian tags<CR>", { desc = "[O]bsidian [t]ags" })
vim.keymap.set("n", "<leader>oT", "<Cmd>Obsidian template<CR>", { desc = "[O]bsidian [t]emplate" })
