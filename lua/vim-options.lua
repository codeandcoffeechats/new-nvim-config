vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")

-- Highlight on yank
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

vim.g.mapleader = " "

vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.swapfile = false

vim.o.signcolumn = "yes"
