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
        },
        {
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
        vim.filetype.add({ extension = { templ = "templ" } })

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
            --"solc",
            "solidity_ls_nomicfoundation",
            "asm_lsp",
            "ts_ls",
            "jsonnet_ls",
            "powershell_es",
            "ansiblels",
            "helm_ls",
            "graphql",
            "pyright",
            "awk_ls",
            "marksman",
            "taplo",
            "templ",
            "lemminx",
            "terraformls",
            "zls",
            "dockerls",
            "gradle_ls",
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

        lspConfig["tailwindcss"].setup({
            capabilities = capabilities,
            filetypes = {
                "templ",
                "astro",
                "javascript",
                "typescript",
                "react",
            },
            init_options = { userLanguages = { templ = "html" } },
        })

        lspConfig["html"].setup({
            capabilities = capabilities,
            filetypes = { "html", "templ" },
        })

        lspConfig["clangd"].setup({
            on_attach = function(_, _)
                require("clangd_extensions.inlay_hints").setup_autocmd()
                require("clangd_extensions.inlay_hints").set_inlay_hints()
            end,
        })

        lspConfig["clangd"].setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
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

        lspConfig["yamlls"].setup(require("schema-companion").setup_client({
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        }))

        lspConfig["gopls"].setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    staticcheck = true,
                    gofumpt = true,
                    codelenses = {
                        gc_details = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        nilness = true,
                        unusedvariable = true,
                        useany = true,
                        shadow = true,
                    },
                },
            },
        })
    end,
}
