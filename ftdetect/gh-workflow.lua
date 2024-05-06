vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        "*/.github/workflows/*.yaml",
        "*/.github/workflows/*.yml",
    },
    callback = function()
        vim.bo.filetype = "yaml.ghworkflow"
    end,
})
