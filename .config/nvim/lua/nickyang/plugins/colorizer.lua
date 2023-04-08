-- import colorizer safely
local colorizer_setup, colorizer = pcall(require, "colorizer")
if not colorizer_setup then
	return
end

colorizer.setup({
	"*",
})
