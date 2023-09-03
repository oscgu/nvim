require('nvim-treesitter.configs').setup {
    highlight = {
        enabled = true,
        disable = {
            "go",
            "c",
            "solidity",
            "typescript",
            "jsonnet",
            "csharp",
            "json",
            "lua",
            "bash",
            "python"
        }
    }
}
