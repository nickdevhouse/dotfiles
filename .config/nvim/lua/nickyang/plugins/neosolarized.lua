-- import neosolarized safely
local neosolarized_setup, neosolarized = pcall(require, "neosolarized")
if not neosolarized_setup then
	return
end

neosolarized.setup({
	comment_italics = true,
})

local cb = require("colorbuddy.init")
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new("white", "#ffffff")
Color.new("black", "#000000")
Color.new("borderGrey", "#96A0A1")
Color.new("light", "#D2D3D3")
Color.new("pmenuSelGrey", "#586e75")
Color.new("codeActionNumber", "#719e07")
Group.new("Normal", colors.base1, colors.NONE, styles.NONE)
Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new("Visual", colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

-- Custom Lspsaga UI colors
Group.new("HoverBorder", colors.borderGrey, colors.none, styles.NONE)
Group.new("SagaBorder", colors.borderGrey, colors.none, styles.NONE)
Group.new("Pmenu", colors.none, colors.none, styles.NONE)
Group.new("PmenuSel", colors.light, colors.pmenuSelGrey, styles.bold)
Group.new("CodeActionNumber", colors.codeActionNumber, colors.none, styles.bold)
