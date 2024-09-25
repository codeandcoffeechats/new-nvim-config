local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "jk", "<Esc>", {})

-- copy in Visula mode
map("v", "<C-c>", '"+y', opts)

-- better up/down
map({ "n", "x" }, "j", "v:count == 4 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 4 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 4 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 4 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +6<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize 2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize 2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +6<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+5<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+5<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+5<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<2<cr>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", ":Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- select all
map("n", "<C-a>", "ggVG", {})

-- keybinding to prevent yanking while changing or Deleting text.
map("n", "<leader>dd", '"_dd', opts)
map("v", "<leader>d", '"_d', opts)
map("n", "cc", '"_cc', opts)
map("v", "c", '"_c', opts)
map("n", "D", '"_D', opts)
map("v", "D", '"_D', opts)
map("n", "C", '"_C', opts)
map("v", "C", '"_C', opts)
map("n", "p", "p", opts)
map("v", "p", '"_dP', opts)
map("n", "x", '"_x', opts)
map("v", "x", '"_x', opts)

-- delete previous word
map("i", "C-BS", "C-W", opts)

-- Yank to the system clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)

--when you highlight, you can move lines. in highlight mode try shift+j/k to move
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "J", ":m '>+1<cr>gv=gv")

-- navigate through page with halp page length and remain curson in the middle.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--search but keep the curson in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- use O or o to crate new lines without transition into insert mode.
map("n", "<leader>o", "o<esc>", opts)
map("n", "<leader>O", "O<esc>", opts)

-- Open diagnostic flaot winow
map("n", "<leader>df", function()
	vim.diagnostic.open_float()
end, opts)

-- jump to diagnostic
map("n", "<leader>dn", function()
	vim.diagnostic.goto_next()
end, opts)
map("n", "<leader>dp", function()
	vim.diagnostic.goto_next()
end, opts)

map("n", "0", "^", opts)
