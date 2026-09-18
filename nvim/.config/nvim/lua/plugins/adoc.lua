-- lua/plugins/adoc.lua
return {
    -- Syntax highlighting, folding, and compile commands
    {
        "habamax/vim-asciidoctor",
        ft = { "asciidoctor" },
        init = function()
            -- Compiler
            vim.g.asciidoctor_executable = "asciidoctor"
            vim.g.asciidoctor_extensions = { "asciidoctor-diagram" }

            -- PDF
            vim.g.asciidoctor_pdf_executable = "asciidoctor-pdf"
            vim.g.asciidoctor_pdf_extensions = { "asciidoctor-diagram" }

            -- Folding: header, list, block (pick one)
            vim.g.asciidoctor_folding = 1
            vim.g.asciidoctor_fold_options = 1
        end,
    },

    -- Live browser preview (requires Node.js)
    {
        "tigion/nvim-asciidoc-preview",
        ft = { "asciidoctor" },
        build = "cd server && npm install --omit=dev --no-save",
        keys = {
            { "<leader>cp", "<cmd>AsciiDocPreview<cr>", desc = "AsciiDoc Preview Open" },
            { "<leader>cP", "<cmd>AsciiDocPreviewStop<cr>", desc = "AsciiDoc Preview Stop" },
        },
        opts = {
            server = {
                converter = "js", -- "js" = Asciidoctor.js (no local install needed)
                -- "cmd" = local asciidoctor binary
            },
            preview = {
                position = "current", -- "current" | "last"
            },
        },
    },
}
