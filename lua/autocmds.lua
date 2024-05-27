vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
        require("conform").format({ async = true, lsp_fallback = false })
    end,
})

