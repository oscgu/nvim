local map = vim.keymap.set

-- Diagnostics
map("n", "<leader>of", function()
    vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Open diagnostic float" })

map("n", "<leader>gn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>gp", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

