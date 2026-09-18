return {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
        require("tabnine").setup({
            tabnine_enterprise_host = "https://console.tabnine.com",
        })
    end,
}
