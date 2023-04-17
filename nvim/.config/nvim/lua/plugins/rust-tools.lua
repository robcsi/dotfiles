return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    -- opts = function()
    --     return require("config.plugins.rust-tools")
    -- end,
    config = function(_, _)
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
    end,
}
