return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        enable_git_status = true,
        filesystem = {
            hijack_netrw_behavior = "open_default",
            follow_current_file = true,
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false, -- only works on Windows for hidden files/directories
            },
        },
    },
}
