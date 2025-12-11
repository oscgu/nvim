return {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    keys = {
        { "<A-S-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    },
    opts = {
        size = 80,
        open_mapping = [[<A-T>]],
        direction = "vertical",
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                local kopts = { buffer = 0 }
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], kopts)
                vim.keymap.set("t", "jk", [[<C-\><C-n>]], kopts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], kopts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], kopts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], kopts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], kopts)
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], kopts)
            end,
        })
    end,
}
