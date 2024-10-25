local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    float_border = 'rounded',
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        -- auto config
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        -- manual config
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                on_init = function(client)
                    lsp_zero.nvim_lua_settings(client, {})
                end,
            })
        end,

        clangd = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.offsetEncoding = 'utf-8'
            require('lspconfig').clangd.setup({
                capabilities = capabilities
            })
        end,
    }
})

-- manual install & config
require('lspconfig').hls.setup({
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell"
        }
    }
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        -- confirm completion item
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

        -- trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

    }),
    -- note: if you are going to use lsp-kind (another plugin)
    -- replace the line below with the function from lsp-kind
    formatting = lsp_zero.cmp_format({
        max_width = 40
    }),

    autocomplete = false
})

local completion_enabled = false

function Toggle_completion()
    completion_enabled = not completion_enabled

    if completion_enabled then
        cmp.setup({
            completion = {
                autocomplete = { 'TextChanged' },
            }
        })
    else
        cmp.setup({
            completion = {
                autocomplete = false
            }
        })
    end
end

vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>lua Toggle_completion()<CR>', { noremap = true, silent = true })
