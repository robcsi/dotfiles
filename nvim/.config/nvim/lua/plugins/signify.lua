-- vim-signify: VCS gutter signs for SVN only.
-- LazyVim's built-in gitsigns keeps handling git; restricting signify's vcs_list
-- to "svn" avoids double signs on git repos and leaves the git plugins untouched.
-- Requires the `svn` CLI on PATH.
return {
  "mhinz/vim-signify",
  event = "BufReadPre",
  init = function()
    -- Set before the plugin loads (signify reads this at startup).
    vim.g.signify_vcs_list = { "svn" }
  end,
}
