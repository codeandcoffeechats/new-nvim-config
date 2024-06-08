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
		local function open_neotree_cwd()
			local cwd = vim.fn.expand("%:p:h")
			vim.cmd("Neotree reveal left " .. cwd)
		end

		-- Function to reveal Neo-tree in the root directory
		local function open_neotree_root()
			local root = vim.fn.getcwd()
			vim.cmd("Neotree reveal left " .. root)
		end

		-- Key mappings
		vim.keymap.set("n", "<leader>E", open_neotree_cwd, {})
		vim.keymap.set("n", "<leader>e", open_neotree_root, {})
	end,
}
