-- import sen-mode safely
local zenMode_setup, zenMode = pcall(require, "zen-mode")
if not zenMode_setup then
	return
end

zenMode.setup({})

vim.keymap.set("n", "<C-w>o", "<cmd>ZenMode<cr>", { silent = true })
