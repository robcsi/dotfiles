-- https://github.com/loichyan/dotfiles/blob/lazyvim/config/nvim/lua/plugins/_border.lua
-- Set border of some LazyVim plugins to rounded
--
local BORDER_STYLE = "rounded"

return {
    -- lazyvim.plugins.coding
    {
        "nvim-cmp",
        opts = function(_, opts)
            local bordered = require("cmp.config.window").bordered
            return vim.tbl_deep_extend("force", opts, {
                win = {
                    completion = bordered(BORDER_STYLE),
                    documentation = bordered(BORDER_STYLE),
                },
            })
        end,
    },

    -- lazyvim.plugins.editor
    {
        "which-key.nvim",
        opts = { win = { border = BORDER_STYLE } },
    },
    {
        "gitsigns.nvim",
        opts = { preview_config = { border = BORDER_STYLE } },
    },

    -- lazyvim.plugins.lsp
    {
        "nvim-lspconfig",
        opts = function(_, opts)
            -- Set LspInfo border
            require("lspconfig.ui.windows").default_options.border = BORDER_STYLE
            return opts
        end,
    },

    {
        "none-ls.nvim",
        opts = { border = BORDER_STYLE },
    },

    {
        "mason.nvim",
        opts = {
            ui = { border = BORDER_STYLE },
        },
    },

    -- lazyvim.plugins.ui
    {
        "noice.nvim",
        opts = {
            presets = { lsp_doc_border = true },
        },
    },
}
