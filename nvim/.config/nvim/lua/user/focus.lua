local dap_status_ok, focus = pcall(require, "focus")
if not dap_status_ok then
  return
end

--settings here: https://github.com/beauwilliams/focus.nvim
focus.setup {
    autoresize = false,
    winhighlight = true,
    hybridnumber = false,
    signcolumn = auto,
    relativenumber = false
}

-- By default, the highlight groups are setup as such:
--   hi default link FocusedWindow VertSplit
--   hi default link UnfocusedWindow Normal
-- To change them, you can link them to a different highlight group, see `:h hi-default` for more info.
vim.cmd('hi link UnfocusedWindow Normal')
vim.cmd('hi link FocusedWindow CursorLine')
