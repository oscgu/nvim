local cyberdream = require("lualine.themes.cyberdream")

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "cyberdream",
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
                color = { bg = "#161821", fg = "#6b7089", gui = "bold" },
            },
        },
        lualine_c = { { "filename", path = 1 } },
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
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
})
