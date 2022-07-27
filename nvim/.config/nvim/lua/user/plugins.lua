local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- vimwiki settings
vim.g.vimwiki_list = {
  {
    path = "~/vimwiki/",
    syntax = "markdown",
    ext = "md"
  }
}
-- vim.g.vimwiki_ext2syntax = {
--   ['.md'] = 'markdown',
--   ['.markdown'] = 'markdown',
--   ['.mdown'] = 'markdown',
-- }
vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_global_ext = 0

vim.cmd ":call vimwiki#vars#init()"

-- Install your plugins here
return packer.startup(function(use)
    -- their plugins here
    use { "wbthomason/packer.nvim"} -- Have packer manage itself
    use { "nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins
    use { "windwp/nvim-autopairs"} -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim"}
    use { "JoosepAlviste/nvim-ts-context-commentstring"}
    use { "kyazdani42/nvim-web-devicons"}
    use { "kyazdani42/nvim-tree.lua"}
    use { "akinsho/bufferline.nvim"}
    use { "moll/vim-bbye"}
    use { "lewis6991/impatient.nvim"}
    use { "lukas-reineke/indent-blankline.nvim"}
    use { "mhinz/vim-startify" }

    -- Colorschemes
    use { "folke/tokyonight.nvim"}
    use { "lunarvim/darkplus.nvim"}
    use { "joshdick/onedark.vim" }
    use { "arzg/vim-substrata"}
    use { "lunarvim/onedarker.nvim"}

    -- cmp plugins
    use { "hrsh7th/nvim-cmp"} -- The completion plugin
    use { "hrsh7th/cmp-buffer"} -- buffer completions
    use { "hrsh7th/cmp-path"} -- path completions
    use { "saadparwaiz1/cmp_luasnip"} -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp"}
    use { "hrsh7th/cmp-nvim-lua"}

    -- snippets
    use { "L3MON4D3/LuaSnip"} --snippet engine
    use { "rafamadriz/friendly-snippets"} -- a bunch of snippets to use

    -- LSP
    use { "neovim/nvim-lspconfig"} -- enable LSP
    use { "williamboman/nvim-lsp-installer"} -- simple to use language server installer
    use { "jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
    use { "RRethy/vim-illuminate"}

    -- Telescope
    use { "nvim-telescope/telescope.nvim"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {'nvim-treesitter/nvim-treesitter-context'}

    -- Git
    use { "lewis6991/gitsigns.nvim"}

    -- DAP
    use { "mfussenegger/nvim-dap"}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { "ravenxrz/DAPInstall.nvim"}
    use 'theHamsta/nvim-dap-virtual-text'

    -- mine
    use "tami5/lspsaga.nvim"
    use "mhartington/formatter.nvim"
    use "hrsh7th/vim-vsnip"
    use "tpope/vim-fugitive"
    use "xolox/vim-misc"
    use "xolox/vim-shell"
    use "mbbill/undotree"
    use "tpope/vim-unimpaired"
    use "junegunn/vim-peekaboo"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "airblade/vim-rooter"
    -- use "voldikss/vim-floaterm"
    use "psliwka/vim-smoothie"
    use "tpope/vim-eunuch"
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
    -- use "rust-lang/rust.vim"
    use "tjdevries/lsp_extensions.nvim"
    use "preservim/tagbar"
    use "szw/vim-maximizer"
    use "samoshkin/vim-mergetool"
    use "kassio/neoterm"
    use "hoob3rt/lualine.nvim"
    use "ryanoasis/vim-devicons"
    -- use "zefei/vim-wintabs"
    -- use "zefei/vim-wintabs-powerline"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope-project.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use "Yggdroot/indentLine"
    use "kshenoy/vim-signature"
    use "nvim-lua/lsp-status.nvim"
    use {
        "saecki/crates.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            require("crates").setup()
        end
    }
    use "simrat39/rust-tools.nvim"
    use "p00f/nvim-ts-rainbow"
    use {
        "folke/trouble.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
    }
    use "rcarriga/nvim-notify"
    use "matbme/JABS.nvim"
    use "ghillb/cybu.nvim"
    use "nacro90/numb.nvim"
    use { "lalitmee/browse.nvim",
            requires = { "nvim-telescope/telescope.nvim" },
    }
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    use "b0o/incline.nvim"
    use { "beauwilliams/focus.nvim" }

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
    }
    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use{
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
