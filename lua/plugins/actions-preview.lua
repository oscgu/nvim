return {
    "aznhe21/actions-preview.nvim",
    keys = {
        {
            "<leader>cam",
            function()
                require("actions-preview").code_actions()
            end,
        },
    },
}
