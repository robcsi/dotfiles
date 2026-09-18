return {
  "robcsi/gvfilter.vim",
  cmd = {
    "GVFilterGFilter",
    "GVFilterVFilter",
    "GVFilterToggle",
    "GVFilterClear",
    "GVFilterStart",
    "GVFilterStop",
    "GVFilterShow",
    "GVFilterRefresh",
  },
  keys = {
    { "<leader>gv", ":GVFilterVFilter ", desc = "Filter (keep matching)" },
    { "<leader>gG", ":GVFilterGFilter ", desc = "Filter (hide matching)" },
    { "<leader>gT", "<cmd>GVFilterToggle<cr>", desc = "Toggle filter" },
    { "<leader>gC", "<cmd>GVFilterClear<cr>", desc = "Clear filter" },
    { "<leader>gS", "<cmd>GVFilterStart<cr>", desc = "Start monitoring" },
    { "<leader>gX", "<cmd>GVFilterStop<cr>", desc = "Stop monitoring" },
  },
  opts = {
    timer_interval = 1000,
    on_changed = true,
  },
}
