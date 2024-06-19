vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
        require("conform").format({ async = true, lsp_fallback = false })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.c",
    callback = function()
        require("conform").format({ async = true, lsp_fallback = false })
    end,
})

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
            c = { "clang_format" },
            cpp = { "clang_format" },
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
