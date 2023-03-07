-- vim.g.taskwiki_markup_syntax = "markdown"
-- vim.g.vimwiki_markdown_link_ext = 1
-- vim.g.vimwiki_global_ext = 0
-- vim.cmd(":unlet g:vimwiki_syntaxlocal_vars")
-- vim.cmd(":call vimwiki#vars#init()")

return {
  "vimwiki/vimwiki",
  keys = { "<leader>ww" },
  init = function()
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
  end,
}
