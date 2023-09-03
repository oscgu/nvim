local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig')['gopls'].setup {
    cmd = { "gopls", "serve" },
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    filetypes = { "c" }
}

require('lspconfig')['solc'].setup {
    capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}

require('lspconfig')["jsonnet_ls"].setup {
    capabilities = capabilities
}

require('lspconfig')["omnisharp"].setup {
    capabilities = capabilities,
    cmd = { "omnisharp" },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true
}

require('lspconfig')["jsonls"].setup {
    capabilities = capabilities,
    cmd = { "vscode-json-languageserver", "--stdio" }
}

require('lspconfig')["lua_ls"].setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require('lspconfig')["bashls"].setup {
    capabilities = capabilities,
    settings = {
        shellcheck = {
            enable = true,
            command = "shellcheck"
        }
    }
}

require('lspconfig')["powershell_es"].setup {
    bundle_path = '~/ps'
}

require('lspconfig')["ansiblels"].setup {
    capabilities = capabilities
}

require('lspconfig')["helm_ls"].setup {
    capabilities = capabilities
}

require('lspconfig')["pylsp"].setup{
    capabilities = capabilities
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
})
