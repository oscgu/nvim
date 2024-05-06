return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
        {
            "<leader>F",
            function()
                require("conform").format({ async = true, lsp_fallback = false })
            end,
            desc = "Format file",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "gofumpt", "golines" },
            c = { "clangformat" },
            cpp = { "clangformat" },
            graphql = { "prettier" },
            html = { "prettier" },
            json = { "jq" },
            markdown = { "prettier" },
            sql = { "pgformat" },
            typescript = { "prettier" },
            xml = { "tidier" },
            yaml = { "yamlfmt" },
            python = { "black", "isort", "ruff_format" },
        },
    },
}
