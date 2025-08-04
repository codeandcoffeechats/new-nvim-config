return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      -- window = {
      -- 	position = "current",
      -- },
      filesystem = {
        filtered_items = {
          hide_dotfiles = true,
          hide_by_name = { "node_modules" },
          always_show = {
            ".gitignore",
          },
          always_show_by_pattern = {
            ".env*",
          },
        },
        follow_current_file =
        {
          enabled = true,         -- This will open the current file in the tree
          leave_dirs_open = true, -- This will keep the parent directories open
        },
      },
    })

    local function open_neotree_cwd()
      local cwd = vim.fn.expand("%:p:h")
      vim.cmd("Neotree reveal toggle " .. cwd)
    end

    -- Key mappings
    vim.keymap.set("n", "<leader>E", open_neotree_cwd, { desc = "Open NeoTree at current file's directory" })
    vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal toggle<CR><CR>", { desc = "Toggle NeoTree" })
  end,
}
