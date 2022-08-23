require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.clang_format.with({
            extra_args = { "-style=file" }
        })
    }
})
