return {
    "stevearc/oil.nvim",
    keys = {
        { "<leader>oi", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    config = function(_, opts)
        local oil = require("oil")

        local function get_winbar()
            local dir = oil.get_current_dir()
            if dir then
                return vim.fn.fnamemodify(dir, ":~")
            else
                return vim.api.nvim_buf_get_name(0)
            end
        end

        _G._oil_winbar = get_winbar

        opts.win_options = opts.win_options or {}
        opts.win_options.winbar = "%!v:lua._oil_winbar()"

        oil.setup(opts)
    end,
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
}
