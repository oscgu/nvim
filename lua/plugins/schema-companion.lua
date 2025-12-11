return {
    "cenk1cenk2/schema-companion.nvim",
    ft = { "yaml" },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        require("schema-companion").setup({})

        local adapter = require("schema-companion").adapters.yamlls.setup({
            sources = {
                require("schema-companion").sources.matchers.kubernetes.setup({
                    version = "master",
                }),
                require("schema-companion").sources.lsp.setup(),
                require("schema-companion").sources.schemas.setup({
                    {
                        name = "Kubernetes master",
                        uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
                    },
                }),
            },
        })

        vim.lsp.config(
            "yamlls",
            require("schema-companion").setup_client(adapter, {
                settings = {
                    yaml = {
                        format = { enable = true },
                        validate = true,
                        schemaStore = { enable = false },
                    },
                },
            })
        )
        vim.lsp.enable("yamlls")
    end,
}
