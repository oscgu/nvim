local basic_lsps = {
    "gopls",
    "clangd",
    "solc",
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
    "sqlls"
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in ipairs(basic_lsps) do
    require("lspconfig")[lsp].setup({
        capabilities = capabilities,
    })
end

require("lspconfig")["clangd"].setup({
    on_attach = function(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
    end
})

require("lspconfig")["omnisharp"].setup({
    capabilities = capabilities,
    cmd = { "omnisharp" },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
})

require("lspconfig")["jsonls"].setup({
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

require("lspconfig")["lua_ls"].setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig")["bashls"].setup({
    capabilities = capabilities,
    settings = {
        shellcheck = {
            enable = true,
            command = "shellcheck",
        },
    },
})

require("lspconfig")["yamlls"].setup({
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
