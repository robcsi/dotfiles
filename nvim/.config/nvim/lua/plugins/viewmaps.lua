return {
  dir = "~/projects/viewmaps.vim",
  cmd = { "ViewMaps", "ViewMapsToggle" },
  keys = {
    { "<leader>vm", "<cmd>ViewMaps n<CR>", desc = "View Normal Mappings" },
    { "<leader>vi", "<cmd>ViewMaps i<CR>", desc = "View Insert Mappings" },
    { "<leader>vv", "<cmd>ViewMaps v<CR>", desc = "View Visual Mappings" },
  },
  opts = {
    window = {
      border = "rounded",
    },
  },
}
