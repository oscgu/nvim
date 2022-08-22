local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

require('lspconfig')['solc'].setup {
    capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}

require('lspconfig')['vls'].setup {
    cmd = {"v", "ls", "--debug", "--generate-report"},
    filetypes = {"vlang", "v"},
    capabilities = capabilities
}

