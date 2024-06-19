return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble qflist toggle<cr>",
        },
    },
}
