local mapkey = require("keymapper").mapvimkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to other buffer
mapkey("<leader>`", "e #", "n") -- Switch to other buffer

-- Directory navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<C-Up>", "resize +2", "n")
mapkey("<C-Down>", "resize -2", "n")
mapkey("<C-Left>", "vertical resize +2", "n")
mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")

-- LSP
local opts = { noremap = true, silent = true, buffer = bufnr }

mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
mapkey("gd", "Lspsaga peek_definition", "n", opts) -- peak definition
mapkey("gD", "Lspsaga goto_definition", "n", opts) -- go to definition
mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
mapkey("<leader>X", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
mapkey("<leader>x", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
mapkey("[d", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
mapkey("]d", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
mapkey("<C-t>", "Lspsaga term_toggle", "n", opts) -- toggle terminal
mapkey("<leader>o", "Lspsaga outline", "n", opts) -- outline
mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

local api = vim.api

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
