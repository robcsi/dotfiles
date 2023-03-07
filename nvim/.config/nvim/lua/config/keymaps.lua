-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- adding newline before the current line and after
keymap("n", "OO", "O<Esc>", opts)
keymap("n", "oo", "o<Esc>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Fugitive
-- keymap("n", "<leader>q", ":TcloseAll! | :xall!<CR>", opts)
keymap("n", "<leader>p", ":vsplit<CR> | :terminal git push<CR>i", opts)

-- scroll by 3 lines
keymap("n", "<C-e>", "3<C-e>", opts)
keymap("n", "<C-y>", "3<C-y>", opts)
keymap("v", "<C-e>", "3<C-e>", opts)
keymap("v", "<C-y>", "3<C-y>", opts)

keymap("n", "'", "`", opts)
keymap("n", "`", "'", opts)

-- yank to the end of the line
keymap("n", "Y", "y$", opts)
-- general terminal settings
keymap("t", "jj", "<C-\\><C-n>", opts)
keymap("t", ":q!", "<C-\\><C-n>:q!<CR>", opts)
-- Toggle terminal on/off (neovim)
keymap("n", "<M-t>", ":Ttoggle<CR>", opts)
keymap("i", "<M-t>", "<Esc>:Ttoggle<CR>", opts)
keymap("t", "<M-t>", "<C-\\><C-n>:Ttoggle<CR>", opts)

-- Use K to show documentation in preview window.
keymap("n", "H", ":call Show_documentation()<CR>", opts)
vim.api.nvim_exec(
  [[
        function! Show_documentation()
        "if (index(['nvim','help'], &filetype) >= 0)
        execute 'Help '.expand('<cword>')
        "else
        "  execute &keywordprg . " " . expand('<cword>')
        "endif
        endfunction
    ]],
  true
)

-- switch between header and source in C++
keymap("n", "<M-h>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
-- open help in vertical split directly
vim.api.nvim_command("command! -nargs=* -complete=help Help vertical belowright help <args> | vertical resize 85")
