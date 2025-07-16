local map = vim.keymap

-- Exit insert mode with jk
map.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode", noremap = true, silent = true })

-- Copy to system clipboard in Visual mode
map.set("v", "<C-c>", '"+y', { desc = "Copy to System Clipboard", noremap = true, silent = true })

-- Better up/down movement with wrapped lines
map.set(
  { "n", "x" },
  "j",
  "v:count == 4 ? 'gj' : 'j'",
  { desc = "Down (respects wrapped lines)", expr = true, silent = true }
)
map.set(
  { "n", "x" },
  "<Down>",
  "v:count == 4 ? 'gj' : 'j'",
  { desc = "Down (respects wrapped lines)", expr = true, silent = true }
)
map.set(
  { "n", "x" },
  "k",
  "v:count == 4 ? 'gk' : 'k'",
  { desc = "Up (respects wrapped lines)", expr = true, silent = true }
)
map.set(
  { "n", "x" },
  "<Up>",
  "v:count == 4 ? 'gk' : 'k'",
  { desc = "Up (respects wrapped lines)", expr = true, silent = true }
)

-- Window navigation with Ctrl + hjkl
map.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Window", noremap = true, silent = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to Bottom Window", noremap = true, silent = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to Top Window", noremap = true, silent = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Window", noremap = true, silent = true })

-- Resize windows using Ctrl + arrow keys
map.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move current line/selection up or down
map.set("n", "<A-j>", "<cmd>m .+5<cr>==", { desc = "Move Line Down 5 Lines" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Line Up 2 Lines" })
map.set("i", "<A-j>", "<esc><cmd>m .+5<cr>==gi", { desc = "Move Line Down 5 Lines (Insert Mode)" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line Up 2 Lines (Insert Mode)" })
map.set("v", "<A-j>", ":m '>+5<cr>gv=gv", { desc = "Move Selection Down 5 Lines" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up 2 Lines" })

-- Save file with Ctrl+S in multiple modes
map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Access keyword program (K in normal mode)
map.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg (K command)" })

-- Better indenting in visual mode (maintain selection)
map.set("v", "<", "<gv", { desc = "Decrease Indent and Keep Selection" })
map.set("v", ">", ">gv", { desc = "Increase Indent and Keep Selection" })

-- Open Lazy plugin manager
map.set("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy Plugin Manager" })

-- Create a new empty buffer/file
map.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Split windows horizontally and vertically
map.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Horizontally", noremap = true, silent = true })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Vertically", noremap = true, silent = true })

-- Select entire file content
map.set("n", "<C-a>", "ggVG", { desc = "Select All Text" })

-- Keybindings to delete/change without yanking
map.set("n", "<leader>dd", '"_dd', { desc = "Delete Line (No Yank)", noremap = true, silent = true })
map.set("v", "<leader>d", '"_d', { desc = "Delete Selection (No Yank)", noremap = true, silent = true })
map.set("n", "cc", '"_cc', { desc = "Change Line (No Yank)", noremap = true, silent = true })
map.set("v", "c", '"_c', { desc = "Change Selection (No Yank)", noremap = true, silent = true })
map.set("n", "D", '"_D', { desc = "Delete to End of Line (No Yank)", noremap = true, silent = true })
map.set("v", "D", '"_D', { desc = "Delete to End of Line in Selection (No Yank)", noremap = true, silent = true })
map.set("n", "C", '"_C', { desc = "Change to End of Line (No Yank)", noremap = true, silent = true })
map.set("v", "C", '"_C', { desc = "Change to End of Line in Selection (No Yank)", noremap = true, silent = true })
map.set("n", "p", "p", { desc = "Paste", noremap = true, silent = true })
map.set("v", "p", '"_dP', { desc = "Paste Over Selection (No Yank)", noremap = true, silent = true })
map.set("n", "x", '"_x', { desc = "Delete Character (No Yank)", noremap = true, silent = true })
map.set("v", "x", '"_x', { desc = "Delete Selection (No Yank)", noremap = true, silent = true })

-- Delete previous word in insert mode
map.set("i", "<C-BS>", "<C-W>", { desc = "Delete Previous Word", noremap = true, silent = true })

-- Yank to system clipboard
map.set("n", "<leader>y", '"+y', { desc = "Yank to System Clipboard", noremap = true, silent = true })
map.set("v", "<leader>y", '"+y', { desc = "Yank Selection to System Clipboard", noremap = true, silent = true })

-- Scroll and keep cursor in the middle
map.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Half Page (Cursor Centered)" })
map.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Half Page (Cursor Centered)" })

-- Search navigation with cursor centered
map.set("n", "n", "nzzzv", { desc = "Next Search Result (Cursor Centered)" })
map.set("n", "N", "Nzzzv", { desc = "Previous Search Result (Cursor Centered)" })

-- Create new lines without entering insert mode
map.set("n", "<leader>o", "o<esc>", { desc = "Create Empty Line Below", noremap = true, silent = true })
map.set("n", "<leader>O", "O<esc>", { desc = "Create Empty Line Above", noremap = true, silent = true })

-- Diagnostic functions
map.set("n", "<leader>df", function()
  vim.diagnostic.open_float()
end, { desc = "Open Diagnostic Float Window", noremap = true, silent = true })

-- Navigate diagnostics
map.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to Next Diagnostic", noremap = true, silent = true })

map.set("n", "<leader>dp", function()
  vim.diagnostic.goto_prev()
end, { desc = "Go to Previous Diagnostic", noremap = true, silent = true })

-- Move to first non-whitespace character
map.set("n", "0", "^", { desc = "Go to First Non-Whitespace Character", noremap = true, silent = true })

-- Format and save file
vim.keymap.set("n", "<leader>w", function()
  -- vim.lsp.buf.format({ async = false }) // cus we got conform format on save
  vim.cmd("write")
end, { desc = "Save File", noremap = true, silent = true })

-- Clear search highlighting
map.set("n", "<esc>", ":nohl<CR>", { desc = "Clear Search Highlighting", noremap = true, silent = true })
