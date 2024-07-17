return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "1.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
					},
					file_ignore_patterns = {
						"node_modules",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			local find_with_dotfiles = function()
				builtin.find_files({
					find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
					previewer = false,
				})
			end
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fh", find_with_dotfiles, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			-- to also include dot files.
			-- vim.keymap.set(
			-- 	"n",
			-- 	"<leader>fh",
			-- 	"<cmd>lua require'telescope.builtin'.find_files({ find_commands = {'rg', '--files', '--hidden', '-g', '!.git'} })<CR>",
			-- 	{}
			-- )

			require("telescope").load_extension("ui-select")
		end,
	},
}
