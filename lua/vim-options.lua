vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set number") -- Ensure the current line shows its absolute number

--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.g.mapleader = " "

vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

vim.opt.laststatus = 3

vim.o.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- Add clickboard support
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
