-- theirs
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.ruler = false
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob=" "
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

-- mine
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.cursorline = true
vim.opt.encoding = "utf-8" -- Set default encoding to UTF-8
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.foldenable = false
--[[ vim.opt.foldmethod = "indent" ]]
vim.opt.formatoptions = "l"
vim.opt.hidden = true -- Enable background buffers
vim.opt.hlsearch = false -- Highlight found searches
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "split" -- Get a preview of replacements
vim.opt.incsearch = true -- Shows the match while typing
vim.opt.joinspaces = false -- No double spaces with join
vim.opt.linebreak = true -- Stop words being broken on wrap
vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = "tab:<->,space:·,nbsp:+,eol:↓,trail:●,precedes:<,extends:>"
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative numbers
vim.opt.numberwidth = 5 -- Make the gutter wider by default
vim.opt.scrolloff = 7 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.showmode = false -- Don't display mode
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.smartcase = true -- Do not ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
vim.opt.updatetime = 250
vim.opt.wrap = true
vim.opt.signcolumn = "auto:9"
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.title = true
vim.opt.startofline = false
vim.opt.autochdir = true
vim.opt.wildmode = "full"
vim.opt.wildmenu = true
vim.opt.laststatus = 2
vim.opt.history = 1000
vim.opt.switchbuf = "useopen"
vim.opt.softtabstop = 4 -- Number of spaces tabs count for
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
-- vim.opt.shortmess = "c"
vim.opt.autowriteall = true
vim.opt.showtabline = 1
vim.opt.undofile = true
vim.opt.undodir = vim.fn.getenv("HOME") .. "/.undo"
vim.opt.viewoptions = "folds,cursor,curdir"
-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.guifont = { "Fira Mono", ":h11" }
