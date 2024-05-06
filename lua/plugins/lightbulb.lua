return {
    "kosayoda/nvim-lightbulb",
    event = "BufRead",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    opts = {
        autocmd = {
            enabled = true,
        },
    },
}
