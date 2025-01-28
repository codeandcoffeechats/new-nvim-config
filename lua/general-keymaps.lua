local map = vim.keymap
local opts = { noremap = true, silent = true }

map.set("i", "jk", "<Esc>", opts)

-- copy in Visula mode
map.set("v", "<C-c>", '"+y', opts)

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 4 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 4 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 4 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 4 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", opts)
map.set("n", "<C-j>", "<C-w>j", opts)
map.set("n", "<C-k>", "<C-w>k", opts)
map.set("n", "<C-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>m .+5<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>m .2<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+5<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":m '>+5<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":m '<2<cr>gv=gv", { desc = "Move Up" })

-- save file
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- lazy
map.set("n", "<leader>l", ":Lazy<cr>", { desc = "Lazy" })

-- new file
map.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- windows
map.set("n", "<leader>-", "<C-W>s", opts)
map.set("n", "<leader>|", "<C-W>v", opts)

-- select all
map.set("n", "<C-a>", "ggVG", {})

-- keybinding to prevent yanking while changing or Deleting text.
map.set("n", "<leader>dd", '"_dd', opts)
map.set("v", "<leader>d", '"_d', opts)
map.set("n", "cc", '"_cc', opts)
map.set("v", "c", '"_c', opts)
map.set("n", "D", '"_D', opts)
map.set("v", "D", '"_D', opts)
map.set("n", "C", '"_C', opts)
map.set("v", "C", '"_C', opts)
map.set("n", "p", "p", opts)
map.set("v", "p", '"_dP', opts)
map.set("n", "x", '"_x', opts)
map.set("v", "x", '"_x', opts)

-- delete previous word
map.set("i", "C-BS", "C-W", opts)

-- Yank to the system clipboard
map.set("n", "<leader>y", '"+y', opts)
map.set("v", "<leader>y", '"+y', opts)

-- navigate through page with halp page length and remain curson in the middle.
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")

--search but keep the curson in the middle
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- use O or o to crate new lines without transition into insert mode.
map.set("n", "<leader>o", "o<esc>", opts)
map.set("n", "<leader>O", "O<esc>", opts)

-- Open diagnostic flaot winow
map.set("n", "<leader>df", function()
  vim.diagnostic.open_float()
end, opts)

-- jump to diagnostic
map.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next()
end, opts)
map.set("n", "<leader>dp", function()
  vim.diagnostic.goto_next()
end, opts)

map.set("n",
  "0", "^", opts)

-- save file
map.set("n", "<leader>w", function()
  vim.lsp.buf.format({ async = false })
  vim.cmd('write')
end, opts)

-- erase highlight
map.set("n", "<esc>", ":nohl<CR>", opts)
