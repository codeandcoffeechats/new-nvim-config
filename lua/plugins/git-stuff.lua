return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git Status" })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" })
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff" })
      vim.keymap.set("n", "<leader>gc", ":Gcommit<CR>", { desc = "Git Commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })
      vim.keymap.set("n", "<leader>gco", ":Git checkout<CR>", { desc = "Git Checkout" })
      vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git Add (Stage File)" })
      vim.keymap.set("n", "<leader>gr", ":Gremove<CR>", { desc = "Git Remove (Stage File)" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git line blame" })
    end,
  },
}
