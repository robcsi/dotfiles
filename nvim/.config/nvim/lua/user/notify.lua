local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup {
    background_colour = "Normal",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    -- max_width = 50,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 5000,
    on_open = function(win)
        vim.api.nvim_win_set_option(win, "wrap", true)
    end,
}

vim.notify = notify

