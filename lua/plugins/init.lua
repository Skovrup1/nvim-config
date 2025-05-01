return {
    -- Theme
    {
        "nyoom-engineering/oxocarbon.nvim",
        config = function()
            vim.cmd.colorscheme "oxocarbon"
        end
    },

    -- LSP support
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" }
        }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("configs.tree")
        end
    },

    -- Fuzzy searching
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = function()
            require("configs.telescope")
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        }

    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("configs.harpoon")
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" }
        }
    },

    -- Key helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.which-key")
        end
    },

    -- Futhark LSP support
    {
        "BeneCollyridam/futhark-vim",
    },

    -- Undotree visualizer
    {
        "mbbill/undotree"
    },
}
