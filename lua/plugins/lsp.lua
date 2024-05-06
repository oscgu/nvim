return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    opts = {
        inlay_hints = { enabled = true },
    },
    keys = {
        {
            "<leader>ho",
            function()
                vim.lsp.buf.hover()
            end,
        }, {
            "<leader>rn",
            function()
                vim.lsp.buf.rename()
            end,
        },
        {
            "<leader>df",
            function()
                vim.lsp.buf.definition()
            end,
        },
        {
            "<leader>rr",
            function()
                vim.lsp.buf.references()
            end,
        },
        {
            "<leader>sh",
            function()
                vim.lsp.buf.signature_help()
            end,
        },
        {
            "<leader>gi",
            function()
                vim.lsp.buf.implementation()
            end,
        },
    },
    config = function()
        local signs = {
            Error = "󰅚 ",
            Warn = "󰀪 ",
            Hint = "󰌶 ",
            Info = " ",
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local basic_lsps = {
            "clangd",
            --"solc",
            "solidity_ls_nomicfoundation",
            "tsserver",
            "jsonnet_ls",
            "powershell_es",
            "ansiblels",
            "helm_ls",
            "graphql",
            "pyright",
            "marksman",
            "taplo",
            "lemminx",
            "dockerls",
            "gradle_ls",
            "tailwindcss",
            "sqlls",
            "biome",
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities =
            require("cmp_nvim_lsp").default_capabilities(capabilities)

        local lspConfig = require("lspconfig")

        for _, lsp in ipairs(basic_lsps) do
            lspConfig[lsp].setup({
                capabilities = capabilities,
            })
        end

        lspConfig["clangd"].setup({
            on_attach = function(client, bufnr)
                require("clangd_extensions.inlay_hints").setup_autocmd()
                require("clangd_extensions.inlay_hints").set_inlay_hints()
            end,
        })

        lspConfig["omnisharp"].setup({
            capabilities = capabilities,
            cmd = { "omnisharp" },
            enable_roslyn_analyzers = true,
            organize_imports_on_format = true,
            enable_import_completion = true,
        })

        lspConfig["jsonls"].setup({
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = {
                        enabled = true,
                    },
                },
            },
        })

        require("neodev").setup({
            library = { plugins = true },
        })

        lspConfig["lua_ls"].setup({
            capabilities = capabilities,
        })

        lspConfig["bashls"].setup({
            capabilities = capabilities,
            settings = {
                shellcheck = {
                    enable = true,
                    command = "shellcheck",
                },
            },
        })

        lspConfig["yamlls"].setup({
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })

        lspConfig["gopls"].setup({
            settings = {
                gopls = {
                    staticcheck = true,
                    gofumpt = true,
                    codelenses = {
                        generate = true,
                        gc_details = true,
                        tidy = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
        })
    end,
}
