return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },

    {
        "9seconds/repolink.nvim",
        config = function()
            require("repolink").setup()
        end
    },

    {
        "roobert/action-hints.nvim",
        config = function()
            require("plugins/action-hints")
        end
    },

    {
        'tamton-aquib/zone.nvim',
        config = function()
            require("plugins/zone")
        end
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },

    {
        "folke/neodev.nvim",
        config = function()
            require('neodev').setup({
                library = { plugins = { "nvim-dap-ui" }, types = true }
            })
        end
    },

    'towolf/vim-helm',

    "jbyuki/venn.nvim",

    'Bekaboo/deadcolumn.nvim',

    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = function()
            require('git-conflict').setup()
        end
    },

    {
        'kosayoda/nvim-lightbulb',
        dependencies = 'antoinemadec/FixCursorHold.nvim',
        config = function()
            require("plugins/lightbulb")
        end
    },

    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins/autopairs")
        end
    },

    {
        'cuducos/yaml.nvim',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim"
        }
    },

    {
        'nyoom-engineering/oxocarbon.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme oxocarbon]])
        end
    },

    {
        'neovim/nvim-lspconfig',
        config = function()
            require("plugins/lsp")
        end
    },

    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = function()
            require("plugins/cmp")
        end,
        dependencies = {
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help'
        }
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("plugins/bufferline")
        end
    },


    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'linrongbin16/lsp-progress.nvim'
        },
        config = function()
            require("plugins/lualine")
        end
    },

    {
        'linrongbin16/lsp-progress.nvim',
        config = function()
            require("plugins/lsp-progress")
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'kyazdani42/nvim-web-devicons',
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins/neotree")
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("plugins/treesitter")
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins/telescope")
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        version = 'v2.*',
        config = function()
            require("plugins/toggleterm")
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("plugins/colorizer")
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugins/gitsigns")
        end
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require("plugins/neotest")
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("plugins/trouble")
        end
    }
}
