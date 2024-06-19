return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>re",
            function()
                require("refactoring").refactor("Extract Function")
            end,
        },
        {
            "<leader>rf",
            function()
                require("refactoring").refactor("Extract Function To File")
            end,
        },
        {
            "<leader>rb",
            function()
                require("refactoring").refactor("Extract Block")
            end,
        },
        {
            "<leader>rbf",
            function()
                require("refactoring").refactor("Extract Block")
            end,
        },
    },
    config = {
        prompt_func_return_type = {
            go = true,
            c = true,
        },
        prompt_func_param_type = {
            go = true,
            c = true,
        },
    },
}
