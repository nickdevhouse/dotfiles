-- Neovim Options Doc:
-- https://neovim.io/doc/user/options.html

local opt = vim.opt -- for conciseness

vim.cmd("autocmd!")

opt.shell = "fish"
opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- When patterns matches, no backup file is created
opt.inccommand = "split"

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true

-- line numbers
opt.relativenumber = false -- true: show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.smarttab = true -- In front of a line insearts blanks according to what is used in other places
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one/hlsear
opt.smartindent = true -- Do smart autoindenting when starting a new line
opt.breakindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- When there is a previous search pattern, highlight all tis matches
opt.path:append({ "**" }) -- When finding files using gf, :find, :tabfind and other commands - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" }) -- Ignored node_modules when expanding wildcards

-- cursor line
opt.cursorline = true -- highlight the current cursor line
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- appearance
opt.showcmd = true -- Show command in the last line of the screen
opt.cmdheight = 1 -- Number of screen lines to use for the command-line
opt.laststatus = 2 -- 2: always. Always have a status line

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.wildoptions = "pum" -- Display the completion matches using the popup menu
-- opt.pumblend = 5 -- Enables pseudo-transparentcy fro popup-menu. Valid from 0 ~ 100
opt.winblend = 0 -- Disabled pseudo-transparency for a floating window

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- macOS: use system clipboard as default register
-- opt.clipboard:prepend { 'unnamed', 'unnamedplus' } -- Windows

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })
