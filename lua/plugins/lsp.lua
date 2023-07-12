local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local util = require("lspconfig.util")

require('lspconfig')['gopls'].setup {
    cmd = {"gopls", "serve"},
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
    cmd = { "omnisharp" }
}

require('lspconfig')["jsonls"].setup {
  capabilities = capabilities,
}

require('lspconfig')["bashls"].setup{
    capabilities = capabilities,
    settings = {
        shellcheck =  {
            enable = true,
            command = "shellcheck"
        }
    }
}

require('lspconfig')["powershell_es"].setup{
  bundle_path = '~/ps'
}

require('lspconfig')["ansiblels"].setup{
    capabilities = capabilities
}

require('lspconfig')["helm_ls"].setup{
    capabilities = capabilities
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function toSnakeCase(str)
      return string.gsub(str, "%s*[- ]%s*", "_")
    end

    if client.name == 'omnisharp' then
      local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        tokenModifiers[i] = toSnakeCase(v)
      end
      local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = toSnakeCase(v)
      end
    end
  end,
})

