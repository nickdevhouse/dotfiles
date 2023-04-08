-- import git safely
local git_setup, git = pcall(require, "git")
if not git_setup then
	return
end

git.setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})
