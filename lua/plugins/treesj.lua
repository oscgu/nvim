return {
    "Wansmer/treesj",
    keys = {
        { "<leader>j", "<cmd>TSJToggle<cr>" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("treesj").setup()
    end
}
