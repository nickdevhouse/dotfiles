-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>c", '"_c')
-- keymap.set("n", "<Leader>C", '"_C')
-- keymap.set("v", "<Leader>c", '"_c')
-- keymap.set("v", "<Leader>C", '"_C')
-- keymap.set("n", "<Leader>d", '"_d')
-- keymap.set("n", "<Leader>D", '"_D')
-- keymap.set("v", "<Leader>d", '"_d')
-- keymap.set("v", "<Leader>D", '"_D')

---------------------
-- General Keymaps
---------------------

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<C-j>", "5j")
keymap.set("n", "<C-k>", "5k")
keymap.set("n", "gb", "<C-o>")
keymap.set("n", "gf", "<C-i>")

-- clear search highlights
keymap.set("n", "<leader>ch", ":nohl<CR>")

-- Move up or down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep it centered when searching
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "nzzzv", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- Restart Lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap("n", "t", "<cmd>lua require'hop'.hint_patterns()<cr>", {})

-- lspsaga
vim.keymap.set("n", "<C-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
-- Press twise 'K' would trigger to jump in the prompt window and select content from hover doc
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "grn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
-- Show line diagnostics
vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Clear vim hlsearch (highlight search)
vim.keymap.set("n", "<leader>ch", "<Cmd>noh<CR>", opts)

-- Add commands for flutter-tools
vim.keymap.set("n", ";c", ":Telescope Flutter commands<CR>")
