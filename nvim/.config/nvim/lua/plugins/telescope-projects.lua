return {
    "nvim-telescope/telescope-project.nvim",
    requires = { "nvim-telescope/telescope-file-browser.nvim" },

    config = function()
        require("telescope").load_extension("project")

        require("telescope").setup({
            extensions = {
                project = {
                    display_type = "full",
                    base_dirs = {
                        "~/projects/",
                    },
                    hidden_files = true, -- default: false
                    theme = "dropdown",
                    order_by = "asc",
                    search_by = "title",
                    sync_with_nvim_tree = true, -- default false
                    -- default for on_project_selected = find project files
                    on_project_selected = function(prompt_bufnr)
                        -- Do anything you want in here. For example:
                        local proj_act = require("telescope._extensions.project.actions")
                        proj_act.change_working_directory(prompt_bufnr, false)
                    end,
                },
            },
        })
    end,
}
