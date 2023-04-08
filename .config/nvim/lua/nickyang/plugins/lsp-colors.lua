-- import lsp-colors safely
local lspColors_setup, lspColors = pcall(require, "lsp-colors")
if not lspColors_setup then
	return
end

lspColors.setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981",
})
