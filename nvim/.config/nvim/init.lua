local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

cmd "packadd paq-vim"

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
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
  "glepnir/lspsaga.nvim",
  "hrsh7th/nvim-compe",
  "mhartington/formatter.nvim",
  "phaazon/hop.nvim",
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
  -- {"neoclide/coc.nvim", branch = "release"},
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
  {"iamcco/markdown-preview.nvim", run = "mkdp#util#install()"},
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
  {"nvim-telescope/telescope-fzy-native.nvim", run = "make"},
  -- "fannheyward/telescope-coc.nvim",
  "nvim-telescope/telescope-project.nvim",
  "Yggdroot/indentLine",
  "kshenoy/vim-signature",
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "nvim-lua/lsp-status.nvim",
  "neovim/nvim-lspconfig"
}

-- Hop
require "hop".setup()
map("n", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "<leader>j", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")

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
require "lspconfig".cssls.setup(
  {
    cmd = {"vscode-css-language-server", "--stdio"},
    capabilities = capabilities,
    settings = {
      scss = {
        lint = {
          idSelector = "warning",
          zeroUnits = "warning",
          duplicateProperties = "warning"
        },
        completion = {
          completePropertyWithSemicolon = true,
          triggerPropertyValueCompletion = true
        }
      }
    }
  }
)
require "lspconfig".tsserver.setup {}
require "lspconfig".rust_analyzer.setup {}
require "lspconfig".bashls.setup {}
require "lspconfig".dockerls.setup {}
require "lspconfig".html.setup {}
require "lspconfig".jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}
require "lspconfig".pyright.setup {}
require "lspconfig".vimls.setup {}
require "lspconfig".yamlls.setup {}
require "lspconfig".sumneko_lua.setup {}

-- LSP Prevents inline buffer annotations
vim.lsp.diagnostic.show_line_diagnostics()
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
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = ""
}

map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", {silent = true})
map("n", "<leader>ca", ":Lspsaga code_action<CR>", {silent = true})
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {silent = true})
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", {silent = true})
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {silent = true})
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {silent = true})
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", {silent = true})
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", {silent = true})
map("n", "<leader>cr", ":Lspsaga rename<CR>", {silent = true})
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", {silent = true})

-- Setup treesitter
local ts = require "nvim-treesitter.configs"
ts.setup {ensure_installed = "maintained", highlight = {enable = true}}

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
opt.spelllang = "en"
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

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
vim.api.nvim_exec(
  [[
augroup markdownSpell
    autocmd!
    autocmd FileType markdown,md,txt setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
augroup END
]],
  false
)

-- minimap config
g.minimap_width = 10
g.minimap_auto_start = 0
g.minimap_auto_start_win_enter = 0

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
        {"diagnostics", sources = "nvim-lsp"}
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
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Line bubbling
-- Use these two if you don't have prettier
--map('n'), '<c-j>', '<cmd>m .+1<CR>==')
--map('n,) <c-k>', '<cmd>m .-2<CR>==')
map("n", "<c-j>", "<cmd>m .+1<CR>", {silent = true})
map("n", "<c-k>", "<cmd>m .-2<CR>", {silent = true})
map("i", "<c-j> <Esc>", "<cmd>m .+1<CR>==gi", {silent = true})
map("i", "<c-k> <Esc>", "<cmd>m .-2<CR>==gi", {silent = true})
map("v", "<c-j>", "<cmd>m +1<CR>gv=gv", {silent = true})
map("v", "<c-k>", "<cmd>m -2<CR>gv=gv", {silent = true})

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", {silent = true})

-- Telescope Global remapping
local actions = require("telescope.actions")
-- require("telescope").load_extension("fzy_native")
-- require("telescope").load_extension("coc")
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
      base_dir = "~/projects",
      max_depth = 3,
      display_type = "full"
    }
  }
}

map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes"))<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes"))<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes"))<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes"))<cr>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes"))<cr>')

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
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)

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
-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has("win32") == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
local sumneko_root_path = "/bin"
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require "lspconfig".sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
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
