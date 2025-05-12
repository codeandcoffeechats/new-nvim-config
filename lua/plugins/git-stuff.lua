return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc = "Git Status" })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" })
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Open Git Commit Window" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })
      vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git Add (Stage File)" })
      vim.keymap.set("n", "<leader>gr", ":Gremove<CR>", { desc = "Git Remove (Stage File)" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
        }
      })
      vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git line blame" })
      vim.keymap.set("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Git Hunk" })
      vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Git Hunk" })
      vim.keymap.set("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
      vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
      vim.keymap.set("n", "<leader>ghn", ":Gitsigns next_hunk<CR>", { desc = "Next Git Hunk" })
      vim.keymap.set("n", "<leader>ghN", ":Gitsigns prev_hunk<CR>", { desc = "Previous Git Hunk" })
    end,
  },
}
