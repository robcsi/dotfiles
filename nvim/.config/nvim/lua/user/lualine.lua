local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
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
