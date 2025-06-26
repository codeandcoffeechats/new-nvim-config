return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		require("mason").setup()
		require("mason-lspconfig").setup({
			opts = {
				auto_install = true,
			},
			ensure_installed = {
				"pyright",
				"jsonls",
				"marksman",
				"tailwindcss",
				"cssls",
				"ts_ls",
				"html",
				"lua_ls",
				"gopls",
				"sqls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							require("sqls").on_attach(client, bufnr)
						end,
					})
				end,
			},
		})

		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completion
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "buffer" }, -- Buffer completions (for variable/words in the current buffer(file)
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 70,
					show_labelDetails = true,
				}),
			},
		})

		-- vim.keymap.set("n", "K", function()
		-- 	vim.lsp.buf.hover({
		-- 		border = "rounded",
		-- 		max_width = 80,
		-- 		focusable = true,
		-- 		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		-- 	})
		-- end, { desc = "LSP Hover" }) -- is handled by noice plugin

		vim.diagnostic.config({
			float = {
				border = "rounded",
			},
			signs = true,
			underline = false,
			virtual_text = {
				prefix = "", -- Could be '●', '▎', 'x'
				spacing = 4,
			},
		})

		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })

		-- Find references for the word under your cursor.
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		vim.keymap.set(
			"n",
			"gri",
			require("telescope.builtin").lsp_implementations,
			{ desc = "[G]oto [I]mplementation" }
		)

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]oto [D]efinition" })

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		vim.keymap.set("n", "gO", require("telescope.builtin").lsp_document_symbols, { desc = "Open Document Symbols" })

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		vim.keymap.set(
			"n",
			"gW",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			{ desc = "Open Workspace Symbols" }
		)

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		vim.keymap.set(
			"n",
			"grt",
			require("telescope.builtin").lsp_type_definitions,
			{ desc = "[G]oto [T]ype Definition" }
		)
	end,
}
