return {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    dependencies = "nvim-lua/plenary.nvim",

    config = function(_, _)
        local crates = require("crates")
        crates.setup()
    end,
}
