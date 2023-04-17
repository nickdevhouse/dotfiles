-- import flutter-tools safely
local flutterTools_setup, flutterTools = pcall(require, "flutter-tools")
if not flutterTools_setup then
	return
end

local on_attach = function(client, bufnr)
	local au = vim.api.nvim_create_autocmd
	local ag = vim.api.nvim_create_augroup
	local clear_au = vim.api.nvim_clear_autocmds

	-- Autoformat on save
	local augroup = ag("LspFormatting", { clear = false })
	if client.supports_method("textDocument/formatting") then
		au("BufWritePre", {
			clear_au({ group = augroup, buffer = bufnr }),
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

flutterTools.setup({
	ui = {
		border = "rounded",
		notification_style = "native",
	},
	decorations = {
		statusline = {
			app_version = true,
			device = true,
		},
	},
	widget_guides = {
		enabled = true,
		debug = true,
	},
	closing_tags = {
		highlight = "Comment",
		prefix = "// ",
		enabled = true,
	},
	lsp = {
		color = {
			enabled = false,
			background = true,
			foreground = false,
			virtual_text = true,
			virtual_text_str = "■",
		},
		settings = {
			showTodos = true,
			enableSnippets = true,
			completeFunctionCalls = false,
		},
		on_attach = on_attach,
		capabilities = capabilities,
	},
	debugger = {
		enabled = true,
		run_via_dap = false,
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
})
