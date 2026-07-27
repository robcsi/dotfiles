-- vcscommand.vim: fugitive-like multi-VCS operations (log/diff/annotate/blame/
-- commit) that work for SVN as well as git. On-demand via :VCS* commands only --
-- it adds no gutter signs and doesn't touch fugitive/gitsigns, so the git plugins
-- stay as-is. It auto-detects the file's VCS, so :VCSDiff etc. also work in git.
-- Requires the relevant VCS CLI (svn) on PATH.
return {
  "vim-scripts/vcscommand.vim",
  event = "VeryLazy", -- load after startup so all :VCS* commands are available
}
