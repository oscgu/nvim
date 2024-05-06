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
        local linter = require("lint")

        linter.linters_by_ft = {
            groovy = {
                "npm-groovy-lint",
            },
            c = {
                "clangtidy",
            },
            go = {
                "golangcilint",
                "codespell",
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
                "trivy",
            },
            ghworkflow = {
                "actionlint",
            },
        }
    end,
}
