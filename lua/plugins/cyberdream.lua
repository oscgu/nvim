return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = false,
            italic_comments = true,
            hide_fillchars = false,
            borderless_telescope = true,
        })
        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
}
