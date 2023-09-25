require("mason").setup()

require("mason-lspconfig").setup{
    ensure_installed = {
        "gopls",
        "clangd",
        "solc",
        "tsserver",
        "jsonnet_ls",
        "omnisharp",
        "jsonls",
        "lua_ls",
        "bashls",
        "yamlls",
        "powershell_es",
        "ansiblels",
        "helm_ls",
        "pyright",
        "dockerls",
        "gradle_ls",
        "graphql",
        "marksman",
        "taplo",
        "lemminx"
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig')['gopls'].setup {
    cmd = { "gopls", "serve" },
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
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
    cmd = { "vscode-json-languageserver", "--stdio" },
    settings = {
	json = {
	    schemas = require("schemastore").json.schemas(),
	    validate = {
		    enabled = true
	    },
	},
    },
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

require('lspconfig')["yamlls"].setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
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

require('lspconfig')["pyright"].setup{
    capabilities = capabilities
}

require'lspconfig'.graphql.setup{
    capabilities = capabilities
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
})
