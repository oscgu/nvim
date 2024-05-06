return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", "<cmd>:Telescope find_files<cr>" },
        { "<leader>lg", "<cmd>:Telescope live_grep<cr>" },
        { "<leader>fb", "<cmd>:Telescope buffers<cr>" },
    },
    opts = {
        pickers = {
            find_files = {
                find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "--glob",
                    "!**/.git/*",
                },
            },
        },
    },
}
