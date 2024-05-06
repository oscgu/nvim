return {
    "ray-x/go.nvim",
    config = function()
        require("go").setup()
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
}
