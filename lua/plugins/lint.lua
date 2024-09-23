vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

return {
    "mfussenegger/nvim-lint",
    keys = {
        {
            "<leader>L",
            function()
                require("lint").try_lint()
            end,
        },
    },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            groovy = {
                "npm-groovy-lint",
            },
            go = {
                "golangcilint",
            },
            dockerfile = {
                "hadolint",
            },
            typescript = {
                "eslint",
            },
            javascript = {
                "eslint",
            },
            typescriptreact = {
                "eslint",
            },
            python = {
                "flake8",
            },
            yaml = {
                "yamllint",
            },
            ghworkflow = {
                "actionlint",
            },
        }
    end,
}
