return {
  "folke/snacks.nvim",
  -- LazyVim maps <leader>S to Snacks "Select Scratch Buffer", which shadowed the
  -- fugitive :Git status mapping (see fugitive.lua). Disable it so <leader>S
  -- goes back to Fugitive Status.
  keys = {
    { "<leader>S", false },
    -- Re-bind Select Scratch Buffer to a free key (under the buffer group).
    { "<leader>bs", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  },
}
