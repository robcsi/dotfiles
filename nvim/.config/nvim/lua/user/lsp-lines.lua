local status_ok, lp_lines = pcall(require, "lsp_lines")
if not status_ok then
	return
end

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true
})
