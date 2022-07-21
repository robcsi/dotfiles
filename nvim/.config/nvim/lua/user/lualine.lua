-- local status_ok, lualine = pcall(require, "lualine")
-- if not status_ok then
--     return
-- end
--
local navic = require("nvim-navic")
--
-- lualine.setup {
--     options = {
--         icons_enabled = true,
--         theme = "onedark",
--         -- component_separators = {"∙", "∙"},
--         -- section_separators = {"", ""},
--         section_separators = { left = '', right = '' },
--         component_separators = { left = '', right = '' },
--         -- component_separators = { left = '', right = ''},
--         -- section_separators = { left = '', right = ''},
--         disabled_filetypes = {},
--         always_divide_middle = true,
--         globalstatus = false,
--     },
--     sections = {
--         lualine_a = {"mode", "paste"},
--         lualine_b = {"branch", "diff"},
--         lualine_c = {
--             {"filename", file_status = true, path = 3},
--             {"fileformat"},
--             {
--                 "diagnostics",
--                 -- Table of diagnostic sources, available sources are:
--                 --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
--                 -- or a function that returns a table as such:
--                 --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
--                 sources = {"nvim_lsp"},
--                 -- Displays diagnostics for the defined severity types
--                 sections = {"error", "warn", "info", "hint"},
--                 diagnostics_color = {
--                     -- Same values as the general color option can be used here.
--                     error = "DiagnosticError", -- Changes diagnostics' error color.
--                     warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
--                     info = "DiagnosticInfo", -- Changes diagnostics' info color.
--                     hint = "DiagnosticHint" -- Changes diagnostics' hint color.
--                 },
--                 symbols = {error = "E", warn = "W", info = "I", hint = "H"},
--                 colored = true, -- Displays diagnostics status in color if set to true.
--                 update_in_insert = true, -- Update diagnostics in insert mode.
--                 always_visible = true -- Show diagnostics even if there are none.
--             },
--             { navic.get_location, cond = navic.is_available },
--         },
--         lualine_x = {"filetype"},
--         lualine_y = {
--             {
--                 "progress"
--             }
--         },
--         lualine_z = {
--             {
--                 "location",
--                 icon = ""
--             }
--         }
--     },
--     inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {"filename"},
--         lualine_x = {"location"},
--         lualine_y = {},
--         lualine_z = {}
--     },
--     tabline = {
--         lualine_a = {},
--         lualine_b = {"branch"},
--         lualine_c = {"filename"},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = {}
--     },
--     -- extensions = {"fzf", "fugitive", "quickfix"}
--     extensions = {"fugitive", "quickfix", 'man', 'nvim-tree', 'symbols-outline', 'nvim-dap-ui'}
-- }

-- from Chris
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_lsp" },
    symbols = { error = " ", warn = " " },
    colored = true,
    always_visible = true,
    sections = {"error", "warn", "info", "hint"},
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    icons_enabled = true,
}

local location = {
    "location",
    padding = 1,
    icon = ""
}

local spaces = function()
    return "sp: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
        icons_enabled = true,
        theme = "onedark",
        disabled_filetypes = { },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {"branch", "fileformat"},
        lualine_c = { diff, { navic.get_location, cond = navic.is_available }},
        lualine_x = { diagnostics, spaces, "encoding", filetype },
        lualine_y = {},
        lualine_z = {  location ,"progress" },
    },
    extensions = {"fugitive", "quickfix", 'man', 'nvim-tree', 'symbols-outline', 'nvim-dap-ui'}
}
