vim.g.Illuminate_ftblacklist = {'startify', 'NvimTree'}
vim.api.nvim_set_keymap('n', '<a-j>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-k>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
