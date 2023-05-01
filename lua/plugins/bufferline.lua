require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "slope",
        hover = {
            {
                enabled = true,
                delay = 200,
                reveal= {'close'}
            }
        },
        always_show_bufferline = true,
        offsets = {
            filetype = "neo-tree",
            text = "Tree",
            text_align = "center",
            separator = true
        },
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end
    }
}
