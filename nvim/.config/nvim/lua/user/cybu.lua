local status_ok, cybu = pcall(require, "cybu")
if not status_ok then
  return
end

cybu.setup {
  -- from Chris
  -- position = {
  --   relative_to = "win", -- win, editor, cursor
  --   anchor = "topright", -- topleft, topcenter, topright,
  --   -- centerleft, center, centerright,
  --   -- bottomleft, bottomcenter, bottomright
  --   -- vertical_offset = 10, -- vertical offset from anchor in lines
  --   -- horizontal_offset = 0, -- vertical offset from anchor in columns
  --   -- max_win_height = 5, -- height of cybu window in lines
  --   -- max_win_width = 0.5, -- integer for absolute in columns
  --   -- float for relative to win/editor width
  -- },
  -- display_time = 1750, -- time the cybu window is displayed
  -- style = {
  --   path = "relative", -- absolute, relative, tail (filename only)
  --   border = "rounded", -- single, double, rounded, none
  --   separator = " ", -- string used as separator
  --   prefix = "…", -- string used as prefix for truncated paths
  --   padding = 1, -- left & right padding in number of spaces
  --   hide_buffer_id = true,
  --   devicons = {
  --     enabled = true, -- enable or disable web dev icons
  --     colored = true, -- enable color for web dev icons
  --   },
  -- },

  position = {
    relative_to = "win",          -- win, editor, cursor
    anchor = "center",         -- topleft, topcenter, topright,
                                    -- centerleft, center, centerright,
                                    -- bottomleft, bottomcenter, bottomright
    vertical_offset = 10,         -- vertical offset from anchor in lines
    horizontal_offset = 0,        -- vertical offset from anchor in columns
    max_win_height = 5,           -- height of cybu window in lines
    max_win_width = 0.5,          -- integer for absolute in columns
                                    -- float for relative to win/editor width
  },
  style = {
    path = "relative",            -- absolute, relative, tail (filename only)
    border = "rounded",           -- single, double, rounded, none
    separator = " ",              -- string used as separator
    prefix = "…",                 -- string used as prefix for truncated paths
    padding = 1,                  -- left & right padding in number of spaces
    hide_buffer_id = true,        -- hide buffer IDs in window
    devicons = {
      enabled = true,             -- enable or disable web dev icons
      colored = true,             -- enable color for web dev icons
    },
    highlights = {                -- see highlights via :highlight
      current_buffer = "CybuFocus",       -- current / selected buffer
      adjacent_buffers = "CybuAdjacent",  -- buffers not in focus
      background = "CybuBackground",      -- window background
      border = "CybuBorder",              -- border of the window
    },
  },
  behavior = {                    -- set behavior for different modes
    mode = {
      default = {
        switch = "immediate",     -- immediate, on_close
        view = "rolling",         -- paging, rolling
      },
      last_used = {
        switch = "on_close",      -- immediate, on_close
        view = "paging",          -- paging, rolling
      },
    },
  },
  display_time = 750,             -- time the cybu window is displayed
  exclude = {                     -- filetypes, cybu will not be active
    "neo-tree",
    "fugitive",
    "qf",
  },
  fallback = function() end,      -- arbitrary fallback function
                                    -- used in excluded filetypes
}

