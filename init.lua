require('core')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = {
    default = { lazy = true },
    install = { colorscheme = { 'rose-pine' } },
    checker = { enabled = true },
    performance = {
        cache = { enabled = true, },
        rtp = {
            disabled_plugins = {
                'gzip',
                -- 'matchit',
                -- 'matchparen',
                -- 'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    }
}

require('lazy').setup({
        { import = 'plugins' }
    },
    lazy_config
)
