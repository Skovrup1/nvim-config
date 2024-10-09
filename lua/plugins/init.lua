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

        --[[{
            "yetone/avante.nvim",
            event = "VeryLazy",
            lazy = false,
            opts = {
                -- add any opts here
            },
            keys = {
                { "<leader>aa", function() require("avante.api").ask() end,     desc = "avante: ask",    mode = { "n", "v" } },
                { "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
                { "<leader>ae", function() require("avante.api").edit() end,    desc = "avante: edit",   mode = "v" },
            },
            dependencies = {
                "stevearc/dressing.nvim",
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                --- The below dependencies are optional,
                "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                {
                    -- support for image pasting
                    "HakonHarnes/img-clip.nvim",
                    event = "VeryLazy",
                    opts = {
                        -- recommended settings
                        default = {
                            embed_image_as_base64 = false,
                            prompt_for_file_name = false,
                            drag_and_drop = {
                                insert_mode = true,
                            },
                            -- required for Windows users
                            use_absolute_path = true,
                        },
                    },
                },
                {
                    -- Make sure to setup it properly if you have lazy=true
                    'MeanderingProgrammer/render-markdown.nvim',
                    opts = {
                        file_types = { "markdown", "Avante" },
                    },
                    ft = { "markdown", "Avante" },
                },
            },
        },
        ]]
    }
}
