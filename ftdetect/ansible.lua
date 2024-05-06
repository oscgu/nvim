vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        "*/playbooks/*.yml",
        "*/playbooks/*.yaml",
        "*/roles/*/tasks/*.yml",
        "*/roles/*/tasks/*.yaml",
        "*/roles/*/handlers/*.yml",
        "*/roles/*/handlers/*.yaml",
    },
    callback = function()
        vim.bo.filetype = "yaml.ansible"
    end,
})
