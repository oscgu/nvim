local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

require('lspconfig')['solc'].setup {
    capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}

local opts = { noremap=true, silent=true}

vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "d]", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)

