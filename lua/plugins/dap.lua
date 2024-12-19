return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "leoluz/nvim-dap-go",
        },
        keys = {
            {
                "<leader>dbp",
                function()
                    require("dap").toggle_breakpoint()
                end,
            },
            {
                "<leader>dcb",
                function()
                    require("dap").clear_breakpoints()
                end,
            },
            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
            },
            {
                "<leader>dsi",
                function()
                    require("dap").step_into()
                end,
            },
            {
                "<leader>dso",
                function()
                    require("dap").step_over()
                end,
            },
            {
                "<leader>do",
                function()
                    require("dap").step_out()
                end,
            },
        },
        config = function()
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" },
            }

            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "🟥", texthl = "", linehl = "", numhl = "" }
            )
            vim.fn.sign_define(
                "DapStopped",
                { text = "▶️", texthl = "", linehl = "", numhl = "" }
            )
        end,
    },
}
