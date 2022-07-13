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

-- Plugins
require "paq" {
  "savq/paq-nvim",
  "tami5/lspsaga.nvim",
  "hrsh7th/nvim-compe",
  "mhartington/formatter.nvim",
  "savq/paq-nvim",
  "wfxr/minimap.vim",
  "hrsh7th/vim-vsnip",
  "tpope/vim-fugitive",
  "xolox/vim-misc",
  "xolox/vim-shell",
  "simnalamburt/vim-mundo",
  "tpope/vim-commentary",
  "tpope/vim-unimpaired",
  "junegunn/vim-peekaboo",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {"neoclide/coc.nvim", branch = "release"},
  "mhinz/vim-startify",
  {"junegunn/fzf", run = "fzf#install()"},
  "junegunn/fzf.vim",
  "airblade/vim-rooter",
  "airblade/vim-gitgutter",
  "voldikss/vim-floaterm",
  "psliwka/vim-smoothie",
  "tpope/vim-eunuch",
  "joshdick/onedark.vim",
  "vifm/vifm.vim",
  "t9md/vim-quickhl",
  "vimwiki/vimwiki",
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = {"markdown"}
    end,
    ft = {"markdown"}
  },
  "dyng/ctrlsf.vim",
  "rust-lang/rust.vim",
  "tjdevries/lsp_extensions.nvim",
  "preservim/tagbar",
  "szw/vim-maximizer",
  "stsewd/fzf-checkout.vim",
  "samoshkin/vim-mergetool",
  "kassio/neoterm",
  "hoob3rt/lualine.nvim",
  "ryanoasis/vim-devicons",
  "pacha/vem-tabline",
  "mengelbrecht/lightline-bufferline",
  "zefei/vim-wintabs",
  "zefei/vim-wintabs-powerline",
  "kyazdani42/nvim-web-devicons",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-project.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "Yggdroot/indentLine",
  "kshenoy/vim-signature",
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "nvim-lua/lsp-status.nvim",
  "neovim/nvim-lspconfig",
  -- "github/copilot.vim",
  {
    "saecki/crates.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = function()
      require("crates").setup()
    end
  },
  "simrat39/rust-tools.nvim",
  "williamboman/nvim-lsp-installer",
  "mfussenger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "Pocco81/DAPInstall.nvim",
  "p00f/nvim-ts-rainbow",
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
}

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
map("n", "<leader>e", ":CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width -60<CR>")
-- --open-action-strategy=vsplit
map("n", "<leader>q", ":TcloseAll! | :xall!<CR>")
map("n", "<leader>p", ":vsplit<CR> | :terminal git push<CR>i")
map("n", "<leader>v", ":CocSearch -S <C-r><C-w><CR>")
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
map("n", "<leader>C", ":Commits<CR>")
map("n", "<leader>B", ":BCommits<CR>")
map("n", "<leader>b", ":Buffers<CR>")
map("n", "<leader>G", ":GFiles?<CR>")
map("n", "<leader>r", ":Tags<CR>")
map("n", "<leader>gb", ":GBranches<CR>")
map("n", "<leader><tab>", ":Maps<CR>")

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

-- mapping for next and previous buffer
-- nnoremap <leader>. :bnext<CR>
-- nnoremap <leader>, :bprev<CR>

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

-- mundo
map("n", "<F5>", ":MundoToggle<CR>")
g.mundo_width = 60
g.mundo_preview_height = 20
g.mundo_right = 1
g.mundo_preview_bottom = 1
g.mundo_auto_preview = 1

-- git gutter mappings -- these are available by default
map("n", "<leader>hp", ":GitGutterPreviewHunk<CR>")
map("n", "<leader>hs", ":GitGutterStageHunk<CR>")
map("n", "<leader>hu", ":GitGutterUndoHunk<CR>")
map("n", "<leader>hf", ":GitGutterFold<CR>")
map("n", "[c", ":GitGutterPrevHunk<CR>")
map("n", "]c", ":GitGutterNextHunk<CR>")
vim.api.nvim_command("command! Gqf GitGutterQuickFix | copen")
map("n", "<leader>hq", ":Gqf<CR>")
g.gitgutter_highlight_linenrs = 1
g.gitgutter_highlight_lines = 0

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

-- vim.cmd(
--   [[
-- augroup markdown!
-- 	autocmd!
-- 	au FileType markdown packadd! markdownPreview
-- 	au FileType markdown setlocal spell spelllang=pt_pt,en_us
-- 	au FileType markdown inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
-- 	au FileType markdown nmap <F5> <Plug>MarkdownPreviewToggle
-- 	au FileType markdown set conceallevel=2
-- 	augroup END
-- ]]
-- )

-- CtrlSF
g.ctrlsf_auto_focus = {["at"] = "start"}
g.ctrlsf_auto_preview = 1
g.ctrlsf_default_view_mode = "compact"

-- terminal settings
-- vim.api.nvim_exec([[
-- augroup termopen
--     autocmd TermOpen * setlocal statusline=%{b:term_title}
-- augroup END
-- ]], true)
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
  map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  -- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  -- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  map("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
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

-- require "lspconfig".tsserver.setup {}
-- require "lspconfig".rust_analyzer.setup {}
-- require "lspconfig".bashls.setup {}
-- require "lspconfig".dockerls.setup {}
-- require "lspconfig".html.setup {}
-- require "lspconfig".pyright.setup {}
-- require "lspconfig".vimls.setup {}
-- require "lspconfig".yamlls.setup {}
-- require "lspconfig".sumneko_lua.setup {}
-- require "lspconfig".clangd.setup {}
-- require "lspconfig".cmake.setup {}
-- require "lspconfig".texlab.setup {}
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
-- map("n", "C-n", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
-- map("n", "C-p", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
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

-- Colourscheme config
--[[ vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 1
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_virtual_text = "colored"
vim.g.everforest_current_word = "bold" ]]
-- Load the colorscheme
cmd [[colorscheme onedark]] -- Put your favorite colorscheme here

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

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
-- vim.api.nvim_exec(
--   [[
-- augroup markdownSpell
--     autocmd!
--     autocmd FileType markdown,md,txt setlocal spell
--     autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
-- augroup END
-- ]],
--   false
-- )

-- minimap config
g.minimap_width = 10
g.minimap_auto_start = 0
g.minimap_auto_start_win_enter = 0

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
  extensions = {"fzf", "fugitive", "quickfix"}
}

-- Compe setup start
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true
  }
}

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
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- End Compe related setup

-- Open nvimrc file
map("n", "<Leader>V", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>vs", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>as", "ggVG<c-$>")

-- Tab to switch buffers in Normal mode
-- map("n", "<Tab>", ":bnext<CR>")
-- map("n", "<S-Tab>", ":bprevious<CR>")

-- Line bubbling
-- Use these two if you don't have prettier
--map('n'), '<c-j>', '<cmd>m .+1<CR>==')
--map('n,) <c-k>', '<cmd>m .-2<CR>==')
-- map("n", "<c-j>", "<cmd>m .+1<CR>")
-- map("n", "<c-k>", "<cmd>m .-2<CR>")
-- map("i", "<c-j> <Esc>", "<cmd>m .+1<CR>==gi")
-- map("i", "<c-k> <Esc>", "<cmd>m .-2<CR>==gi")
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

-- map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes"))<cr>')
-- map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
-- map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes"))<cr>')
-- map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes"))<cr>')
-- map("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
-- map("n", "<leader>f", '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes"))<cr>')
-- map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
-- map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes"))<cr>')
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

-------------------- COMMANDS ------------------------------
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
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- switch between header and source in C++
vim.api.nvim_set_keymap("n", "<M-h>", "<cmd>ClangdSwitchSourceHeader<cr>", {silent = true, noremap = true})
