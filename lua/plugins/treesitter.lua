return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    main = "nvim-treesitter.configs",
    opts = {
        highlight = {
            enable = true,
        }
    },
}
