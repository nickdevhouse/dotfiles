-- import nvim-ts-autotag safely
local autotag_setup, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_setup then
	return
end

autotag.setup({})
