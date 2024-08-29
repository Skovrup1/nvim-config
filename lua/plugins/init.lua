return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "oxocarbon"
        end,
    },
    {
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v4.x",
            lazy = false,
            config = function()
                require("configs.lsp")
            end,
            dependencies = {
                { "williamboman/mason.nvim" },
                { 'williamboman/mason-lspconfig.nvim' },
                { 'neovim/nvim-lspconfig' },
                { 'L3MON4D3/LuaSnip' },
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        },

        -- LSP Support
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                { "williamboman/mason-lspconfig.nvim" },
            },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("configs.tree")
            end
        },

        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            config = function()
                require("configs.telescope")
            end,
            dependencies = {
                "nvim-lua/plenary.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
            }

        },

        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            config = function()
                require("configs.harpoon")
            end,
            dependencies = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope.nvim" },
            }
        },

        -- Key helper
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            version = "2.*",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {}
        },
    }
}
