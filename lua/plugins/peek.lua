return {
    "Saimo/peek.nvim",
    build = "deno task --quiet build:fast",
    cmd = { "PeekOpen", "PeekClose" },
    ft = {
        "markdown",
        "md",
    },
    config = function()
        require("peek").setup()

        vim.api.nvim_create_user_command("PeekOpen", function()
            require("peek").open()
        end, {})

        vim.api.nvim_create_user_command("PeekClose", function()
            require("peek").close()
        end, {})
    end,
}
