return require('packer').startup(function(use)

    use 'towolf/vim-helm'

    use "jbyuki/venn.nvim"

    use 'Bekaboo/deadcolumn.nvim'

    use {
      'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
      end
    }

    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = function()
            require("plugins/lightbulb")
        end
    }

    use  {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins/autopairs")
        end
    }

    use {
        'cuducos/yaml.nvim',
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim"
        }
    }

    use 'wbthomason/packer.nvim'

    use 'nyoom-engineering/oxocarbon.nvim'

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
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins/bufferline")
        end
    }


    use {
        'nvim-lualine/lualine.nvim',
        requires = { 
            'kyazdani42/nvim-web-devicons', 
            'linrongbin16/lsp-progress.nvim'
        },
        config = function()
            require("plugins/lualine")
        end
    }

    use {
        'linrongbin16/lsp-progress.nvim',
        config = function()
            require("plugins/lsp-progress")
        end
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
        config = function ()
            require("plugins/neotree")
        end
    }

    use { 'nvim-treesitter/nvim-treesitter',
    config = function()
            require("plugins/treesitter")
        end
    }

    use { 'nvim-lua/telescope.nvim', 
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require("plugins/telescope")
        end,
    }

    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("plugins/toggleterm")
    end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("plugins/colorizer")
        end
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function ()
          require("plugins/octo")
      end
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require("plugins/gitsigns")
      end
    }

    use "kdheepak/lazygit.nvim"

    use({
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
      },
      config = function()
          require("plugins/neotest")
      end,
    })

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins/trouble")
        end
    }
end)
