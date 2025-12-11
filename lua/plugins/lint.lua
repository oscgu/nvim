return {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePost" },
    keys = {
        {
            "<leader>L",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint file",
        },
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            groovy = { "npm-groovy-lint" },
            go = { "golangcilint" },
            dockerfile = { "hadolint" },
            typescript = { "eslint" },
            javascript = { "eslint" },
            typescriptreact = { "eslint" },
            python = { "flake8" },
            terraform = { "tflint" },
            ["terraform-vars"] = { "tflint" },
            yaml = { "yamllint" },
            ghworkflow = { "actionlint" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
