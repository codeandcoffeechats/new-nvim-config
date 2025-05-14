return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			sync_install = false,
			ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "sql", "go" }, -- Add parsers you want to ensure are installed
			ignore_install = {}, -- List parsers to ignore during installation
			modules = {}, -- Additional modules can be added here
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
