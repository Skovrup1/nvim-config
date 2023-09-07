---
-- Autocompletion config
---
local luasnip = require('luasnip')
local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()

lsp_zero.extend_cmp()

cmp.setup({
    -- setup by extend_cmp snippet = {},
    formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

        -- Go to the next or prev placeholder in the snippet.
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),

    sources = cmp.config.sources({
        -- setup by extend_cmp { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})
