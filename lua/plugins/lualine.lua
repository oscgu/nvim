local lint_progress = function()
    local linters = require("lint").get_running()
    if #linters == 0 then
        return "󱝿"
    end
    return "󰱼" .. table.concat(linters, ", ")
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            icons_enabled = true,
            component_separators = { left = "|", right = "|" },
            section_separators = "",
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                {
                    "branch",
                    icon = "",
                },
            },
            lualine_c = {
                lint_progress,
                {
                    "filename",
                    path = 1,
                },
                "diagnostics",
            },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                },
                "encoding",
                "fileformat",
            },
            lualine_y = {},
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            "lazy",
            "toggleterm",
        },
    },
}
