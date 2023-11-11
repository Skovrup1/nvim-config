return {
    {
            "catppuccin/nvim", name = "catppuccin", priority = 1000,
            config = function()
                vim.cmd.colorscheme "catppuccin"
            end,
    },
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = false,
            config = function()
                require('configs.lsp')
            end,
            dependencies = {
                { 'williamboman/mason.nvim' },
            }
        },

        -- Debugging
        --{
        --'jay-babu/mason-nvim-dap.nvim',
        --config = function()
        --require('configs.mason-dap')
        --end,
        --dependencies = {
        --'VonHeikemen/lsp-zero.nvim',
        --},
        --},
        --{ 'mfussenegger/nvim-dap' },

        -- LSP Support
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            config = function()
                require('configs.cmp')
            end,
            dependencies = {
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-nvim-lua' },
                { 'L3MON4D3/LuaSnip' },
            }
        },
        {
            'L3MON4D3/LuaSnip',
            lazy = true,
            dependencies = {
                { 'rafamadriz/friendly-snippets' },
            },
        },

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require('configs.tree')
            end
        },

        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            config = function()
                require('configs.telescope')
            end,
            dependencies = {
                'nvim-lua/plenary.nvim',
                { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
            }

        },

        {
            'echasnovski/mini.pairs',
            event = 'VeryLazy',
            opts = {},
        },
        {
            'echasnovski/mini.surround',
            opts = {
                mappings = {
                    add = 'gza',            -- Add surrounding in Normal and Visual modes
                    delete = 'gzd',         -- Delete surrounding
                    find = 'gzf',           -- Find surrounding (to the right)
                    find_left = 'gzF',      -- Find surrounding (to the left)
                    highlight = 'gzh',      -- Highlight surrounding
                    replace = 'gzr',        -- Replace surrounding
                    update_n_lines = 'gzn', -- Update `n_lines`
                },
            },
        },

        -- Key helper
        {
            'folke/which-key.nvim',
            event = 'VeryLazy',
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        }
    }
}
