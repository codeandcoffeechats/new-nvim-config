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
          }
        end,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
