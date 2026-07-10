return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
        { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
    opts = {
        options = {
            notify_user_on_venv_activation = true,
            enable_default_searches = true,
            enable_cached_venvs = true,
            cached_venv_automatic_activation = true,
        },
    },
    event = "VeryLazy",
}
