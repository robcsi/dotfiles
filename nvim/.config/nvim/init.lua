local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
g.mapleader = " "

-- vimwiki setup, before plugin is loaded
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
cmd ":call vimwiki#vars#init()"

vim.cmd [[packadd packer.nvim]]

-- Plugins
require("packer").startup(
  function(use)
    -- use  "savq/paq-nvim"
    use "wbthomason/packer.nvim"
    use "tami5/lspsaga.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "mhartington/formatter.nvim"
    use "hrsh7th/vim-vsnip"
    use "tpope/vim-fugitive"
    use "xolox/vim-misc"
    use "xolox/vim-shell"
    use "mbbill/undotree"
    use "kyazdani42/nvim-tree.lua"
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    }
    use "tpope/vim-unimpaired"
    use "junegunn/vim-peekaboo"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "mhinz/vim-startify"
    -- use  {"junegunn/fzf", run = "fzf#install()"}
    -- use  "junegunn/fzf.vim"
    use "airblade/vim-rooter"
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end
    }
    use "voldikss/vim-floaterm"
    use "psliwka/vim-smoothie"
    use "tpope/vim-eunuch"
    use "joshdick/onedark.vim"
    use "vifm/vifm.vim"
    use "t9md/vim-quickhl"
    use "vimwiki/vimwiki"
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      config = function()
        vim.g.mkdp_filetypes = {"markdown"}
      end,
      ft = {"markdown"}
    }
    use "dyng/ctrlsf.vim"
    use "rust-lang/rust.vim"
    use "tjdevries/lsp_extensions.nvim"
    use "preservim/tagbar"
    use "szw/vim-maximizer"
    -- use  "stsewd/fzf-checkout.vim"
    use "samoshkin/vim-mergetool"
    use "kassio/neoterm"
    use "hoob3rt/lualine.nvim"
    use "ryanoasis/vim-devicons"
    use "pacha/vem-tabline"
    use "mengelbrecht/lightline-bufferline"
    use "zefei/vim-wintabs"
    use "zefei/vim-wintabs-powerline"
    use "kyazdani42/nvim-web-devicons"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-project.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use "Yggdroot/indentLine"
    use "kshenoy/vim-signature"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-lua/lsp-status.nvim"
    use "neovim/nvim-lspconfig"
    use {
      "saecki/crates.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("crates").setup()
      end
    }
    use "simrat39/rust-tools.nvim"
    use "williamboman/nvim-lsp-installer"
    -- use "mfussenger/nvim-dap"
    -- use "rcarriga/nvim-dap-ui"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "nvim-telescope/telescope-dap.nvim"
    -- use "Pocco81/DAPInstall.nvim"
    use "p00f/nvim-ts-rainbow"
    use {
      "folke/trouble.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("trouble").setup()
      end
    }
    use {"L3MON4D3/LuaSnip"}
  end
)

opt.backspace = {"indent", "eol", "start"}
opt.clipboard = "unnamed"
opt.completeopt = "menuone,noselect"
opt.cursorline = true
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
opt.foldenable = false
opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = false -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
opt.linebreak = true -- Stop words being broken on wrap
opt.list = true -- Show some invisible characters
opt.listchars = "tab:<->,space:·,nbsp:+,eol:↓,trail:●,precedes:<,extends:>"
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative numbers
opt.numberwidth = 5 -- Make the gutter wider by default
opt.scrolloff = 7 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = "en"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.updatetime = 250
opt.wrap = true
opt.signcolumn = "auto:9"
opt.showcmd = true
opt.showmatch = true
opt.title = true
opt.startofline = false
opt.autochdir = true
opt.wildmode = "full"
opt.wildmenu = true
opt.laststatus = 2
opt.history = 1000
opt.switchbuf = "useopen,usetab"
opt.softtabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4
opt.backup = false
opt.writebackup = false
opt.cmdheight = 1
opt.shortmess = "c"
opt.autowriteall = true
opt.showtabline = 2
opt.undofile = true
opt.undodir = vim.fn.getenv("HOME") .. "/.undo"

-- general mappings
-- scroll by 3 lines
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")
map("v", "<C-e>", "3<C-e>")
map("v", "<C-y>", "3<C-y>")

map("n", "'", "`")
map("n", "`", "'")

-- yank to the end of the line
map("n", "Y", "y$")

-- Smart way to move between windows
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

-- move through word wrapped line
map("n", "k", "gk")
map("n", "j", "gj")

-- adding newline before the current line and after
map("n", "OO", "O<Esc>")
map("n", "oo", "o<Esc>")

map("n", "<leader><SPACE>", ":CtrlSF <C-r><C-w><CR>")
map("n", "<leader>g", ":Gcd<CR>")
map("n", "<leader>s", ":topleft G<CR>")
-- map("n", "<leader>e", ":CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width -60<CR>")
-- --open-action-strategy=vsplit
map("n", "<leader>q", ":TcloseAll! | :xall!<CR>")
map("n", "<leader>p", ":vsplit<CR> | :terminal git push<CR>i")
-- map("n", "<leader>v", ":CocSearch -S <C-r><C-w><CR>")
map("n", "<leader>t", ":TagbarToggle<CR>")
-- map("n", "H", ":Help .expand('<cword>')<CR>")
map("n", "<leader>S", ":Startify<CR>")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")

-- Use K to show documentation in preview window.
map("n", "H", ":call Show_documentation()<CR>")
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

-- FZF
-- map("n", "<leader>C", ":Commits<CR>")
-- map("n", "<leader>B", ":BCommits<CR>")
-- map("n", "<leader>b", ":Buffers<CR>")
-- map("n", "<leader>G", ":GFiles?<CR>")
-- map("n", "<leader>r", ":Tags<CR>")
-- map("n", "<leader>gb", ":GBranches<CR>")
-- map("n", "<leader><tab>", ":Maps<CR>")

-- shortcut for counting occurence of word under cursor in file
map("n", "<leader>c", ":%s/<c-r><c-w>//gn<cr>")

-- maximixer
g.maximizer_set_default_mapping = 1
map("n", "<leader>tm", ":MaximizerToggle!<CR>")

-- peekaboo settings
g.peekaboo_window = "vertical botright 80new"

-- quickhl shortcuts
map("n", "<Space>m", ":QuickhlManualAdd <c-r><c-w><ESC><CR>")
map("x", "<Space>m", ":QuickhlManualAdd <c-r><c-w><ESC><CR>")
map("n", "<Space>M", ":QuickhlManualReset<CR>")
map("x", "<Space>M", ":QuickhlManualReset<CR>")
map("n", "<Space>j", ":QuickhlManualLockToggle<CR>")

-- custom substitute/sed mapping to shortcut the replacement of work under cursor
map("n", "<leader>z", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>")

-- shortcut to insert current date in file
map("n", "<leader>D", "a**<C-R>=strftime('%Y %b %d @ %H:%M')<cr>** <esc>")

-- open help in vertical split directly
vim.api.nvim_command("command! -nargs=* -complete=help Help vertical belowright help <args> | vertical resize 85")

-- how to exit quickly from Insert mode
-- inoremap <special> jj <ESC>
-- inoremap <special> jk <ESC>:

-- tab handling
vim.api.nvim_command("command! -nargs=0 TabNew :tabnew | Startify")
map("n", "<leader>.", ":tabnext<CR>")
map("n", "<leader>,", ":tabprevious<CR>")
map("n", "<C-t>", ":TabNew<CR>")
map("n", "<C-Delete>", ":tabclose<CR>")

-- vim-mergetool plugin settings
g.mergetool_layout = "mr"
g.mergetool_prefer_revision = "local"
map("n", "<leader>mt", ":MergetoolToggle<CR>")
map("n", "<leader>mb", ":call mergetool#toggle_layout('mr,b')<CR>")
-- smart diff exchange commands
map("n", "<expr> <C-Left>", "&diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'")
map("n", "<expr> <C-Right>", "&diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'")
map("n", "<expr> <C-Down>", "&diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'")
map("n", "<expr> <C-Up>", "&diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'")

map("n", "<F5>", ":UndotreeToggle<CR>")

-- git gutter mappings -- these are available by default
-- map("n", "<leader>hp", ":GitGutterPreviewHunk<CR>")
-- map("n", "<leader>hs", ":GitGutterStageHunk<CR>")
-- map("n", "<leader>hu", ":GitGutterUndoHunk<CR>")
-- map("n", "<leader>hf", ":GitGutterFold<CR>")
-- map("n", "[c", ":GitGutterPrevHunk<CR>")
-- map("n", "]c", ":GitGutterNextHunk<CR>")
-- vim.api.nvim_command("command! Gqf GitGutterQuickFix | copen")
-- map("n", "<leader>hq", ":Gqf<CR>")
-- g.gitgutter_highlight_linenrs = 1
-- g.gitgutter_highlight_lines = 0

-- gitsigns mappings
require("gitsigns").setup {
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map(
      "n",
      "]c",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(
          function()
            gs.next_hunk()
          end
        )
        return "<Ignore>"
      end,
      {expr = true}
    )

    map(
      "n",
      "[c",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(
          function()
            gs.prev_hunk()
          end
        )
        return "<Ignore>"
      end,
      {expr = true}
    )

    -- Actions
    map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)
    map(
      "n",
      "<leader>hb",
      function()
        gs.blame_line {full = true}
      end
    )
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", gs.diffthis)
    map(
      "n",
      "<leader>hD",
      function()
        gs.diffthis("~")
      end
    )
    map("n", "<leader>td", gs.toggle_deleted)

    -- Text object
    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
}

-- tagbar width
g.tagbar_width = 70
g.tagbar_autofocus = 1
map("n", "<leader>t", ":TagbarToggle<CR>")

-- vim-markdown
g.mkdp_auto_close = 0
g.mkdp_refresh_slow = 0
-- example
map("n", "<C-s>", "<Plug>MarkdownPreview")
map("n", "<M-s>", "<Plug>MarkdownPreviewStop")
map("n", "<C-p>", "<Plug>MarkdownPreviewToggle")
g.mkdp_browser = "qutebrowser"

-- CtrlSF
g.ctrlsf_auto_focus = {["at"] = "start"}
g.ctrlsf_auto_preview = 1
g.ctrlsf_default_view_mode = "compact"

cmd "autocmd TermOpen * setlocal statusline=%{b:term_title}" -- disabled in visual mode

-- general terminal settings
map("t", "jj", "<C-\\><C-n>")
map("t", ":q!", "<C-\\><C-n>:q!<CR>")
-- Toggle terminal on/off (neovim )
map("n", "<A-t>", ":Ttoggle<CR>")
map("i", "<A-t>", "<Esc>:Ttoggle<CR>")
map("t", "<A-t>", "<C-\\><C-n>:Ttoggle<CR>")

-- neoterm settings
g.neoterm_size = 20
g.neoterm_default_mod = "botright"
g.neoterm_autoinsert = 1
g.neoterm_autojump = 1

-- Startify shortcuts
map("n", "<A-s>", ":SSave")
g.startify_session_persistence = 1

-- resize windows/splits
map("n", "<Left>", ":vertical resize -5<CR>")
map("n", "<Right>", ":vertical resize +5<CR>")
map("n", "<Up>", ":resize -5<CR>")
map("n", "<Down>", ":resize +5<CR>")

-- wintabs
g.wintabs_autoclose = 0
-- g.wintabs_display = 'statusline'
map("n", "<A-n>", ":WintabsNext<CR>")
map("n", "<A-p>", ":WintabsPrevious<CR>")
map("n", "<A-c>", ":WintabsCloseWindow<CR>")
map("n", "<A-C>", ":WintabsCloseVimtab<CR>")
map("n", "<A-u>", ":WintabsUndo<CR>")
map("n", "<A-o>", ":WintabsOnlyWindow<CR>")
map("n", "<A-r>", ":WintabsRefresh<CR>")

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- LSP Server config
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  -- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  -- map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  -- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  -- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  -- map("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  -- map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- list of lspconfig language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local servers = {
  "tsserver",
  "rust_analyzer",
  "bashls",
  "dockerls",
  "html",
  "pyright",
  "vimls",
  "yamlls",
  "sumneko_lua",
  "clangd",
  "cmake",
  "texlab",
  "jsonls"
}

local nvim_lsp = require("lspconfig")
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end

require "lspconfig".jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}

-- LSP Prevents inline buffer annotations
-- vim.lsp.diagnostic.show_line_diagnostics()
vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false
  }
)

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
local saga = require "lspsaga"
saga.init_lsp_saga {
  code_action_icon = " ",
  definition_preview_icon = "  ",
  diagnostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
  max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
  border_style = "round",
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "s",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-u>" -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>"
  },
  rename_action_keys = {
    quit = "<ESC>",
    exec = "<CR>" -- quit can be a table
  }
}

map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>")
map("n", "<leader>ca", ":Lspsaga code_action<CR>")
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>")
map("n", "C-n", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
map("n", "C-p", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
map("n", "<leader>cs", ":Lspsaga signature_help<CR>")
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>cc", ":Lspsaga show_cursor_diagnostics<CR>")
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>")
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "<leader>cp", ":Lspsaga preview_definition<CR>")
map("n", "<leader>cd", ":Telescope lsp_references<CR>")
map("n", "<leader>rn", ":Lspsaga rename<CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")

-- Setup treesitter
local ts = require "nvim-treesitter.configs"
ts.setup {ensure_installed = "all", highlight = {enable = true}}

cmd [[colorscheme onedark]] -- Put your favorite colorscheme here

-- local githunksummary =
--   vim.api.nvim_exec(
--   [[
-- function! GitHunkSummary()
--     let [a,m,r] = GitGutterGetHunkSummary()
--     return printf('gs: +%d ~%d -%d', a, m, r)
-- endfunction

-- call GitHunkSummary()
-- ]],
--   true
-- )

-- lualine
require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = "onedark",
    component_separators = {"∙", "∙"},
    section_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode", "paste"},
    lualine_b = {"branch", "diff"},
    lualine_c = {
      {"filename", file_status = true, path = 2},
      {
        "diagnostics",
        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = {"nvim_lsp"},
        -- Displays diagnostics for the defined severity types
        sections = {"error", "warn", "info", "hint"},
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = "DiagnosticError", -- Changes diagnostics' error color.
          warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
          info = "DiagnosticInfo", -- Changes diagnostics' info color.
          hint = "DiagnosticHint" -- Changes diagnostics' hint color.
        },
        symbols = {error = "E", warn = "W", info = "I", hint = "H"},
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode.
        always_visible = true -- Show diagnostics even if there are none.
      }
    },
    lualine_x = {"filetype"},
    lualine_y = {
      {
        "progress"
      }
    },
    lualine_z = {
      {
        "location",
        icon = ""
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {"branch"},
    lualine_c = {"filename"},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  -- extensions = {"fzf", "fugitive", "quickfix"}
  extensions = {"fugitive", "quickfix"}
}

--nvim-cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup(
  {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end
    },
    mapping = cmp.mapping.preset.insert(
      {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-e>"] = cmp.mapping(
          {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
          }
        ),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end,
          {
            "i",
            "s"
          }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
          {
            "i",
            "s"
          }
        )
      }
    ),
    formatting = {
      fields = {"kind", "abbr", "menu"},
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu =
          ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = ""
        })[entry.source.name]
        return vim_item
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "luasnip"},
      {name = "buffer"},
      {name = "path"}
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    experimental = {
      ghost_text = true
    }
  }
)

-- nvim-cmp setup start
-- local cmp = require "cmp"
--
-- cmp.setup(
--   {
--     snippet = {
--       -- REQUIRED - you must specify a snippet engine
--       expand = function(args)
--         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--       end
--     },
--     window = {},
--     mapping = cmp.mapping.preset.insert(
--       {
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       }
--     ),
--     sources = cmp.config.sources(
--       {
--         {name = "nvim_lsp"},
--       },
--       {
--         {name = "buffer"}
--       }
--     )
--   }
-- )
--
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype(
--   "gitcommit",
--   {
--     sources = cmp.config.sources(
--       {
--         {name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
--       },
--       {
--         {name = "buffer"}
--       }
--     )
--   }
-- )
--
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(
--   "/",
--   {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       {name = "buffer"}
--     }
--   }
-- )
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(
--   ":",
--   {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources(
--       {
--         {name = "path"}
--       },
--       {
--         {name = "cmdline"}
--       }
--     )
--   }
-- )
-- --Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["sumneko_lua"].setup {
--   capabilities = capabilities
-- }

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["cmp#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

map("i", "<CR>", "cmp#confirm({ 'keys': '<CR>', 'select': v:true })", {expr = true})
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- End Compe related setup

-- Open nvimrc file
map("n", "<Leader>V", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>vs", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>as", "ggVG<c-$>")

-- Line bubbling
map("v", "<c-j>", "<cmd>m +1<CR>gv=gv")
map("v", "<c-k>", "<cmd>m -2<CR>gv=gv")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>")

-- Telescope Global remapping
local actions = require("telescope.actions")
require("telescope").load_extension("project")

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "$ ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false
      },
      vertical = {
        mirror = false
      },
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 120
    },
    preview_height = 1,
    preview_width = 0.8,
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    -- path_display = true,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
    mappings = {
      i = {
        -- ["<esc>"] = actions.close,
        ["<C-q"] = actions.send_to_qflist
      }
    }
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer
        }
      }
    },
    find_files = {
      hidden = true,
      follow = true
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    },
    project = {
      base_dirs = "~/projects",
      max_depth = 3,
      display_type = "full"
    }
  }
}

-- Telescope keybindings
-- Find files using Telescope command-line sugar.
-- general pickers
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", "<leader>fg", "<cmd>Telescope grep_string<cr>")
map("n", "<leader>fr", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")

-- git-specific pickers
map("n", "<leader>fF", "<cmd>Telescope git_files<cr>")
map("n", "<leader>fC", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>fB", "<cmd>Telescope git_bcommits<CR>")
map("n", "<leader>fR", "<cmd>Telescope git_branches<CR>")

-- extensions
map("n", "<leader>fp", "<cmd>Telescope project<cr>")

-- vim-specific pickers
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>ft", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fv", "<cmd>Telescope vim_options<cr>")
map("n", "<leader>fs", "<cmd>Telescope search_history<cr>")
map("n", "<leader>fh", "<cmd>Telescope command_history<cr>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")

-- indentLine
g.indentLine_char_list = {"|", "¦", "┆", "┊"}

cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}" -- disabled in visual mode

-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote"},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettier},
      typescript = {prettier},
      html = {prettier},
      css = {prettier},
      scss = {prettier},
      markdown = {prettier},
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- Runs Formatter on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua : FormatWrite
augroup END
]], true)

-- restoring the last cursor position
vim.api.nvim_exec(
  [[
augroup resCur
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]],
  true
)

-- sumneko_lua
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
-- local sumneko_root_path = "/bin"
-- local sumneko_binary = sumneko_root_path .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require "lspconfig".sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "Lua 5.1",
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        enable = true,
        globals = {"vim"}
      },
      workspace = {
        checkThirdParty = false,
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      }
    }
  }
}

-- copilot suggestion hightlight
-- cmd "highlight CopilotSuggestion guifg=#444444 ctermfg=8"

-- rust-tools config
-- Update this path
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
local opts = {
  -- ... other configs
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  }
}

-- Normal setup
require("rust-tools").setup(opts)

require("nvim-treesitter.configs").setup {
  highlight = {},
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

-- trouble.nvim
map("n", "<leader>xt", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
map("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- switch between header and source in C++
map("n", "<M-h>", "<cmd>ClangdSwitchSourceHeader<cr>", {silent = true, noremap = true})

--nvim-tree
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = ""
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌"
        }
      }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  view = {
    width = 60,
    height = 30,
    side = "left",
    mappings = {
      list = {
        {key = {"l", "<CR>", "o"}, cb = tree_cb "edit"},
        {key = "h", cb = tree_cb "close_node"},
        {key = "v", cb = tree_cb "vsplit"}
      }
    }
  }
}
map("n", "<leader>e", ":NvimTreeToggle<CR>")
