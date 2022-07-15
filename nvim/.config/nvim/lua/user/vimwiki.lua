local status_ok, vimwiki = pcall(require, "vimwiki")
if not status_ok then
	return
end

-- neoterm settings
vim.g.vimwiki_list = {
  {
    path = "~/vimwiki/",
    syntax = "markdown",
    ext = ".md"
  }
}

vim.g.vimwiki_ext2syntax = {
  [".md"] = "markdown"
}

vim.cmd ":call vimwiki#vars#init()"
