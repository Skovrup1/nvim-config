return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'dev-v3',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
        lazy = true,
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('configs.lsp')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' }
        },
        config = function()
            require('configs.cmp')
        end
    },
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        ft = 'rust'
        --config in config.lsp
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('configs.telescope')
        end
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'v3',
        event = { 'VeryLazy' },
        config = function()
            require('ibl').setup({
                indent = { char = '┊', },
            })
        end
    },
    --Debugging
    --{},
    --
    --Git
    --{},
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('configs.rose-pine')
        end
    }
}
