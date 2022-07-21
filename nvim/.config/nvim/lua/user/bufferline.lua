local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local status_ok_custom, custom_areas = pcall(require, "bufferline.custom_area")
if not status_ok_custom then
    return
end

custom_areas = {
    right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
        local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
        local info = #vim.diagnostic.get(0, {severity = seve.INFO})
        local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

        if error ~= 0 then
            table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
        end

        if warning ~= 0 then
            table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
        end

        if hint ~= 0 then
            table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
        end

        if info ~= 0 then
            table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
        end
        return result
    end,
}

bufferline.setup {
    options = {
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        custom_areas,
    },
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "#ff0000" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },

        buffer_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },

        close_button = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },

        tab_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        tab = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        tab_close = {
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },

        duplicate_selected = {
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "TabLineSel" },
            gui = "italic",
        },
        duplicate_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic",
        },
        duplicate = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic",
        },

        modified = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        modified_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        modified_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },

        separator = {
            guifg = { attribute = "bg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
        indicator_selected = {
            guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
            guibg = { attribute = "bg", highlight = "Normal" },
        },
    },
}
