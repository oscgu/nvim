local cyberdream = require("lualine.themes.cyberdream")

local lint_progress = function()
    local linters = require("lint").get_running()
    if #linters == 0 then
        return "󰦕"
    end
    return "󱉶 " .. table.concat(linters, ", ")
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        "linrongbin16/lsp-progress.nvim",
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = cyberdream,
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
                    icon = "",
                    color = {
                        bg = "#161821",
                        fg = "#6b7089",
                        gui = "bold",
                    },
                },
            },
            lualine_c = {lint_progress},
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = {
                        fg = "#ff9e64",
                    },
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
            "neo-tree",
            "toggleterm",
            "trouble",
            "nvim-dap-ui",
        },
    },
}
