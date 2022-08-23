return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'marko-cerovac/material.nvim'

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("plugins/lsp")
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        config = function() 
            require("plugins/cmp")
        end,
        requires = {
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help'
        }
    }

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("plugins/lualine")
        end
    }

    use {
        'max-0406/autoclose.nvim'
    }

    use { 'nvim-treesitter/nvim-treesitter',
    config = function()
        require("plugins/treesitter")
    end
    }

    use { 'nvim-lua/telescope.nvim', 
    config = function()
        require("telescope").setup()
    end,
    requires = {{'nvim-lua/plenary.nvim'}}

    }

    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("plugins/toggleterm")
    end
    }

    use {
        'norcalli/nvim-colorizer.lua'
    }

    use ({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.clang_format.with({
                        extra_args = { "-style=file" }
                    })
                },
            })
        end,
        requires = { "nvim-lua/plenary.nvim" }
    })

end)
