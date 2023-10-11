return {
    {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "h", "cpp", "hpp" },
        config = function()
            require("plugins/clangd-extensions")
        end,
    },

    {
        "barrett-ruth/import-cost.nvim",
        ft = {
            "ts",
            "tsx",
            "js",
            "jsx",
        },
        build = "sh install.sh yarn",
        config = true,
    },

    {
        "windwp/nvim-ts-autotag",
        ft = {
            "tsx",
            "jsx",
            "html",
        },
    },

    {
        "mfussenegger/nvim-lint",
        config = function()
            require("plugins/lint")
        end,
    },

    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugins/formatter")
        end,
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
        end,
    },

    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup()
        end,
    },

    {
        "linrongbin16/lsp-progress.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("lsp-progress").setup()
        end,
    },

    {
        "b0o/incline.nvim",
        event = "BufRead",
        config = function()
            require("plugins/incline")
        end,
    },

    {
        "Wansmer/treesj",
        keys = {
            { "<leader>j", "<cmd>TSJToggle<cr>" },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("treesj").setup()
        end,
    },

    {
        "b0o/schemastore.nvim",
        ft = {
            "yaml",
            "yml",
            "json",
        },
    },

    {
        "Saimo/peek.nvim",
        build = "deno task --quiet build:fast",
        cmd = "PeekOpen",
        ft = {
            "markdown",
            "md",
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        main = "ibl",
        config = function()
            require("plugins/blankline")
        end,
    },

    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
        },
    },

    {
        "NeogitOrg/neogit",
        cmd = {
            "Neogit",
        },
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim", -- optional
            "ibhagwan/fzf-lua", -- optional
        },
        config = true,
    },

    {
        "9seconds/repolink.nvim",
        cmd = {
            "Repolink",
        },
        config = function()
            require("repolink").setup()
        end,
    },

    {
        "towolf/vim-helm",
        ft = {
            "yml",
            "yaml",
        },
    },

    {
        "Bekaboo/deadcolumn.nvim",
        event = "BufRead",
    },

    {
        "akinsho/git-conflict.nvim",
        cmd = {
            "GitConflictListQF",
        },
        config = function()
            require("plugins/git-conflict")
        end,
    },

    {
        "kosayoda/nvim-lightbulb",
        event = "BufRead",
        dependencies = "antoinemadec/FixCursorHold.nvim",
        config = function()
            require("plugins/lightbulb")
        end,
    },

    {
        "weilbith/nvim-code-action-menu",
        event = "BufRead",
        cmd = {
            "CodeActionMenu",
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins/autopairs")
        end,
    },

    {
        "cuducos/yaml.nvim",
        ft = {
            "yaml",
            "yml",
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme oxocarbon]])
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = function()
            require("plugins/lsp")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("plugins/cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "linrongbin16/lsp-progress.nvim",
        },
        config = function()
            require("plugins/lualine")
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins/neotree")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plugins/treesitter")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins/telescope")
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        version = "*",
        config = function()
            require("plugins/toggleterm")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function()
            require("plugins/colorizer")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("plugins/gitsigns")
        end,
    },

    {
        "nvim-neotest/neotest",
        cmd = "Neotest",
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
        cmd = "TroubleToggle",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins/trouble")
        end,
    },
}
