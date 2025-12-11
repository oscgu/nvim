return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this" },
        { "<leader>]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
        { "<leader>[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev hunk" }
    },
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text_pos = "eol",
        },
    },
}
