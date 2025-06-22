return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- -- OPTIONAL:
		-- --   `nvim-notify` is only needed, if you want to use the notification view.
		-- --   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
		-- config = function()
		--   require("notify").setup({
		--     background_colour = "#000000",
		--   })
		-- end,
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
				signature = {
					enabled = false, -- enable signature help
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			views = {
				cmdline_popup = {
					border = {
						style = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
					},
				},
				popupmenu = {
					border = {
						style = "rounded", -- Same options as above
					},
				},
				hover = {
					border = {
						style = "rounded",
					},
				},
				mini = {
					border = {
						style = "rounded",
					},
				},
			},
		})
		-- Noice keybindings
		vim.keymap.set("n", "<leader>nh", "<cmd>Noice<CR>", { desc = "Open Noice history" })
		vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>", { desc = "Show last Noice message" })
		vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<CR>", { desc = "Show Noice errors" })
		vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "Dismiss Noice notifications" })
		vim.keymap.set("n", "<leader>nt", "<cmd>Noice toggle<CR>", { desc = "Toggle Noice UI" })
	end,
}
