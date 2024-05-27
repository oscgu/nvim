return {
    "nvim-neotest/neotest",
    cmd = "Neotest",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neotest/nvim-nio",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
        "nvim-extensions/nvim-ginkgo",
    },
    config = function()
        -- get neotest namespace (api call creates or returns namespace)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message = diagnostic.message
                        :gsub("\n", " ")
                        :gsub("\t", " ")
                        :gsub("%s+", " ")
                        :gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        local nt = require("neotest")

        nt.setup({
            status = { virtual_text = true },
            adapters = {
                require("neotest-go"),
                require("nvim-ginkgo"),
            },
        })

        vim.api.nvim_create_user_command("NeotestFile", function()
            nt.run.run(vim.fn.expand("%"))
        end, {})

        vim.api.nvim_create_user_command("NeotestSummary", function()
            nt.run(nt.summary.toggle())
        end, {})

        vim.api.nvim_create_user_command("Neotest", function()
            nt.run.run(vim.uv.cwd())
        end, {})
    end,
}
