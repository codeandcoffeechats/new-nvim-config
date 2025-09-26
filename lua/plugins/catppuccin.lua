return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            CursorLineNr = { fg = colors.peach },
            LineNr = { fg = colors.overlay2 },
            -- For float windows and tooltips (e.g., LSP hovers, diagnostics)
            NormalFloat = { bg = colors.none },
            FloatBorder = { bg = colors.none, fg = colors.peach }, -- Adjust fg for visible borders if desired

            -- For completion menu (Pmenu for built-in, or if using nvim-cmp)
            Pmenu = { bg = colors.none },
            PmenuSel = { bg = colors.surface1 }, -- Slight highlight for selected item; adjust as needed
            PmenuSbar = { bg = colors.none },
            PmenuThumb = { bg = colors.none },

            -- If using nvim-cmp specifically
            CmpBorder = { bg = colors.none, fg = colors.peach },
            CmpItemAbbr = { bg = colors.none },
            CmpItemAbbrMatch = { bg = colors.none },
            CmpItemKind = { bg = colors.none },
            CmpItemMenu = { bg = colors.none },

            -- Optional: For other tooltips or popups (e.g., command-line completions)
            FloatTitle = { bg = colors.none },
            MsgArea = { bg = colors.none },
          }
        end,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
