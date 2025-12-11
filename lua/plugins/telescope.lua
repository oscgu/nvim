return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
        { "<leader>rs", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
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
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("csharpls_definition")
    end,
}
