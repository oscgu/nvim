function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    keys = {
        { "<leader>oi", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
    },
    opts = {
        view_options = {
            show_hidden = true,
        },
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
    },
}
