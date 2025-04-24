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
  disable_frontmatter = false,
  templates = {
    folder = "templates",
  },
  picker = {
    name = "telescope.nvim",
  },
  ui = {
    enable = true,
  },
})

vim.keymap.set("n", "<leader>oo", "<Cmd>ObsidianOpen<CR>", { desc = "[O]pen in [O]bsidian" })
vim.keymap.set("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", { desc = "[O]bsidian [s]earch" })
vim.keymap.set("n", "<leader>of", "<Cmd>ObsidianFollowLink<CR>", { desc = "[O]bsidian [f]ollow link" })
vim.keymap.set("n", "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", { desc = "[O]bsidian [b]acklinks" })
vim.keymap.set("n", "<leader>ot", "<Cmd>ObsidianTags<CR>", { desc = "[O]bsidian [t]ags" })
vim.keymap.set("n", "<leader>oT", "<Cmd>ObsidianTemplate<CR>", { desc = "[O]bsidian [t]emplate" })
vim.keymap.set("n", "<leader>oT", "<Cmd>ObsidianTemplate<CR>", { desc = "[O]bsidian [t]emplate" })
