return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function()
		local hooks = require("ibl.hooks")
		-- Create the highlight groups
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#9c9c9c" }) -- Active indent (bright white)
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3A3A3A" }) -- Other indents (subtle dark gray)
		end)

		return {
			indent = {
				char = "▏",
				highlight = "IblIndent",
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				injected_languages = false,
				highlight = "IblScope",
				priority = 1024,
			},
		}
	end,
}
