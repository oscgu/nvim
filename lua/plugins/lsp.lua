return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        "saghen/blink.cmp",
        "b0o/schemastore.nvim",
    },
    event = "BufReadPre",
    keys = {
        { "<leader>ho", vim.lsp.buf.hover, desc = "Hover" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>df", vim.lsp.buf.definition, desc = "Go to definition" },
        { "<leader>rr", vim.lsp.buf.references, desc = "Find references" },
        { "<leader>sh", vim.lsp.buf.signature_help, desc = "Signature help" },
        { "<leader>gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
    },
    config = function()
        -- Enable inlay hints when LSP attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end
            end,
        })
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = " ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            },
        })

        local basic_lsps = {
            "arduino_language_server",
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
            "lua_ls",
            "gopls",
            "jdtls",
        }

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for _, lsp in ipairs(basic_lsps) do
            vim.lsp.config(lsp, {
                capabilities = capabilities,
            })
            vim.lsp.enable(lsp)
        end

        vim.lsp.config("tailwindcss", {
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
        vim.lsp.enable("tailwindcss")

        vim.lsp.config("html", {
            capabilities = capabilities,
            filetypes = { "html", "templ" },
        })
        vim.lsp.enable("html")

        vim.lsp.config("clangd", {
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
        vim.lsp.enable("clangd")

        vim.lsp.config("jsonls", {
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
        vim.lsp.enable("jsonls")

        vim.lsp.config("bashls", {
            capabilities = capabilities,
            settings = {
                shellcheck = {
                    enable = true,
                    command = "shellcheck",
                },
            },
        })
        vim.lsp.enable("bashls")

        vim.lsp.config("csharp_ls", {
            capabilities = capabilities,
            handlers = {
                ["textDocument/definition"] = require("csharpls_extended").handler,
                ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
            },
        })
        vim.lsp.enable("csharp_ls")
    end,
}
