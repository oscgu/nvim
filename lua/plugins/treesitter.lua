return {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    main = "nvim-treesitter.configs",
    opts = {
        highlight = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
    },
}
