return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		terminal = {
			enabled = true,
			win = {
				style = "float", -- Set the window style to floating
				border = "rounded", -- Optional: Add a rounded border to the floating terminal
				width = 0.8, -- Optional: Set the width as a percentage of the screen
				height = 0.8, -- Optional: Set the height as a percentage of the screen
			},
		},
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = true },
	},
}
