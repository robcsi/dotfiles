-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<leader>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- general mappings
-- scroll by 3 lines
keymap("n", "<C-e>", "3<C-e>", opts)
keymap("n", "<C-y>", "3<C-y>", opts)
keymap("v", "<C-e>", "3<C-e>", opts)
keymap("v", "<C-y>", "3<C-y>", opts)

keymap("n", "'", "`", opts)
keymap("n", "`", "'", opts)

-- yank to the end of the line
keymap("n", "Y", "y$", opts)

-- Smart way to move between windows
keymap("n", "<C-j>", "<C-W>j", opts)
keymap("n", "<C-k>", "<C-W>k", opts)
keymap("n", "<C-h>", "<C-W>h", opts)
keymap("n", "<C-l>", "<C-W>l", opts)

-- move through word wrapped line
keymap("n", "k", "gk", opts)
keymap("n", "j", "gj", opts)

-- adding newline before the current line and after
keymap("n", "OO", "O<Esc>", opts)
keymap("n", "oo", "o<Esc>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fn", "<cmd>Telescope notify<CR>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fv", "<cmd>Telescope vim_options<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope search_history<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope command_history<cr>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
--[[ keymap("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts) ]]
keymap("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)
keymap("n", "<leader>fF", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>fC", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>fB", "<cmd>Telescope git_bcommits<CR>", opts)
keymap("n", "<leader>fR", "<cmd>Telescope git_branches<CR>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope project<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope media_files<cr>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Startify
keymap("n", "<leader>S", ":Startify<CR>", opts)
-- keymap("n", "<M-s>", ":SSave", opts)

-- CtrlSF
keymap("n", "<leader><space>", ":CtrlSF <C-r><C-w><CR>", opts)

-- Fugitive
keymap("n", "<leader>g", ":Gcd<CR>", opts)
keymap("n", "<leader>s", ":topleft G<CR>", opts)
keymap("n", "<leader>q", ":TcloseAll! | :xall!<CR>", opts)
keymap("n", "<leader>p", ":vsplit<CR> | :terminal git push<CR>i", opts)

-- Tagbar
vim.g.tagbar_width = 70
vim.g.tagbar_autofocus = 1
keymap("n", "<leader>t", ":TagbarToggle<CR>", opts)

keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

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

-- shortcut for counting occurence of word under cursor in file
keymap("n", "<leader>c", ":%s/<c-r><c-w>//gn<cr>", opts)

-- maximixer
vim.g.maximizer_set_default_mapping = 1
keymap("n", "<leader>tm", ":MaximizerToggle!<CR>", opts)

-- peekaboo settings
vim.g.peekaboo_window = "vertical botright 80new"

-- quickhl shortcuts
keymap("n", "<leader>m", ":QuickhlManualAdd <c-r><c-w><ESC><CR>", opts)
keymap("x", "<leader>m", ":QuickhlManualAdd <c-r><c-w><ESC><CR>", opts)
keymap("n", "<leader>M", ":QuickhlManualReset<CR>", opts)
keymap("x", "<leader>M", ":QuickhlManualReset<CR>", opts)
keymap("n", "<leader>j", ":QuickhlManualLockToggle<CR>", opts)

-- custom substitute/sed mapping to shortcut the replacement of work under cursor
keymap("n", "<leader>z", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>", opts)

-- shortcut to insert current date in file
keymap("n", "<leader>D", "a**<C-R>=strftime('%Y %b %d @ %H:%M')<cr>** <esc>", opts)

-- open help in vertical split directly
vim.api.nvim_command("command! -nargs=* -complete=help Help vertical belowright help <args> | vertical resize 85")

-- tab handling
vim.api.nvim_command("command! -nargs=0 TabNew :tabnew | Startify")
keymap("n", "<leader>.", ":tabnext<CR>", opts)
keymap("n", "<leader>,", ":tabprevious<CR>", opts)
keymap("n", "<C-t>", ":TabNew<CR>", opts)
keymap("n", "<C-Delete>", ":tabclose<CR>", opts)

-- vim-mergetool plugin settings
vim.g.mergetool_layout = "mr"
vim.g.mergetool_prefer_revision = "local"
keymap("n", "<leader>mt", ":MergetoolToggle<CR>", opts)
keymap("n", "<leader>mb", ":call mergetool#toggle_layout('mr,b')<CR>", opts)
-- smart diff exchange commands
keymap("n", "<expr> <C-Left>", "&diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'", opts)
keymap("n", "<expr> <C-Right>", "&diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'", opts)
keymap("n", "<expr> <C-Down>", "&diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'", opts)
keymap("n", "<expr> <C-Up>", "&diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'", opts)

-- undotree
keymap("n", "<F5>", ":UndotreeToggle<CR>", opts)

-- vim-markdown
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0
-- example
keymap("n", "<C-s>", "<Plug>MarkdownPreview", opts)
keymap("n", "<M-s>", "<Plug>MarkdownPreviewStop", opts)
keymap("n", "<C-p>", "<Plug>MarkdownPreviewToggle", opts)
vim.g.mkdp_browser = "qutebrowser"

-- CtrlSF
vim.g.ctrlsf_auto_focus = {["at"] = "start"}
vim.g.ctrlsf_auto_preview = 1
vim.g.ctrlsf_default_view_mode = "compact"

vim.cmd "autocmd TermOpen * setlocal statusline=%{b:term_title}" -- disabled in visual mode

-- general terminal settings
keymap("t", "jj", "<C-\\><C-n>", opts)
keymap("t", ":q!", "<C-\\><C-n>:q!<CR>", opts)
-- Toggle terminal on/off (neovim )
keymap("n", "<M-t>", ":Ttoggle<CR>", opts)
keymap("i", "<M-t>", "<Esc>:Ttoggle<CR>", opts)
keymap("t", "<M-t>", "<C-\\><C-n>:Ttoggle<CR>", opts)

-- resize windows/splits
keymap("n", "<Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<Right>", ":vertical resize +5<CR>", opts)
keymap("n", "<Up>", ":resize -5<CR>", opts)
keymap("n", "<Down>", ":resize +5<CR>", opts)

-- wintabs
vim.g.wintabs_autoclose = 0
-- vim.g.wintabs_display = 'statusline'
vim.g.wintabs_ignored_filetypes = {"NvimTree", "startify", "gitcommit"}
keymap("n", "<M-n>", ":WintabsNext<CR>", opts)
keymap("n", "<M-p>", ":WintabsPrevious<CR>", opts)
keymap("n", "<M-c>", ":WintabsCloseWindow<CR>", opts)
keymap("n", "<M-C>", ":WintabsCloseVimtab<CR>", opts)
keymap("n", "<M-u>", ":WintabsUndo<CR>", opts)
keymap("n", "<M-o>", ":WintabsOnlyWindow<CR>", opts)
keymap("n", "<M-r>", ":WintabsRefresh<CR>", opts)

-- LspSaga
keymap("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", opts)
keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
keymap("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
keymap("n", "C-n", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
keymap("n", "C-p", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
keymap("n", "<leader>cs", ":Lspsaga signature_help<CR>", opts)
keymap("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>cc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
keymap("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "<leader>cp", ":Lspsaga preview_definition<CR>", opts)
keymap("n", "<leader>cd", ":Telescope lsp_references<CR>", opts)
keymap("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)

-- Cmp
keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true}, opts)
keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true}, opts)
keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true}, opts)
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true}, opts)

-- Open nvimrc file
keymap("n", "<Leader>V", "<cmd>e $MYVIMRC<CR>", opts)

-- Source nvimrc file
keymap("n", "<Leader>vs", ":luafile %<CR>", opts)

-- Quick new file
keymap("n", "<Leader>n", "<cmd>enew<CR>", opts)

-- Easy select all of file
keymap("n", "<Leader>as", "ggVG<c-$>", opts)

-- Line bubbling
keymap("v", "<c-j>", "<cmd>m +1<CR>gv=gv", opts)
keymap("v", "<c-k>", "<cmd>m -2<CR>gv=gv", opts)

--After searching, pressing escape stops the highlight
keymap("n", "<esc>", ":noh<cr><esc>", opts)

-- trouble.nvim
keymap("n", "<leader>xt", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
-- keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opts)

-- switch between header and source in C++
keymap("n", "<M-h>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)

-- jabs
keymap("n", "<leader>fb", "<cmd>JABSOpen<cr>", opts)

-- cybu
keymap("n", "<M-p>", "<Plug>(CybuPrev)", opts)
keymap("n", "<M-n>", "<Plug>(CybuNext)", opts)

-- illuminate
keymap('n', '<M-j>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<M-k>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- browse
keymap("n", "<M-o>", "<cmd>BrowseBookmarks<cr>", opts)
keymap("n", "<M-i>", "<cmd>BrowseInputSearch<cr>", opts)

-- bufferline
keymap("n", "<leader>bp", ":BufferLinePick<cr>", opts)

--focus
keymap('n', '<M-l>', ':FocusSplitNicely<CR>', opts)
keymap('n', '<leader>h', ':FocusSplitLeft<CR>', opts)
keymap('n', '<leader>j', ':FocusSplitDown<CR>', opts)
keymap('n', '<leader>k', ':FocusSplitUp<CR>', opts)
--[[ keymap('n', '<leader>l', ':FocusSplitRight<CR>', opts) ]]

-- neotree
keymap('n', '<M-e>', ':Neotree filesystem reveal float<CR>', opts)
keymap('n', '<M-b>', ':Neotree buffers reveal float<CR>', opts)

-- rest
keymap('n', '<M-r>', '<Plug>RestNvim', opts)
-- keymap('n', '<M-r>', '<Plug>RestNvimPreview', opts)

-- lsp-lines -- find a better keymap here...
keymap("n", "<leader>lt", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" }, opts)

-- Todo-comments
keymap ('n', '<leader>fc', ':TodoTelescope<CR>', opts)

