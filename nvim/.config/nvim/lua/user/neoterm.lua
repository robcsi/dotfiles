local status_ok, neoterm = pcall(require, "neoterm")
if not status_ok then
	return
end

-- neoterm settings
vim.g.neoterm_size = 20
vim.g.neoterm_default_mod = "botright"
vim.g.neoterm_autoinsert = 1
vim.g.neoterm_autojump = 1
