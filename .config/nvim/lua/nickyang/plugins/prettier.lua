-- import prettier safely
local prettier_setup, prettier = pcall(require, "prettier")
if not prettier_setup then
	return
end

prettier.setup({
	bin = "prettierd",
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
	},
})
