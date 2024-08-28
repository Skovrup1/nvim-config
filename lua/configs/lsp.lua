local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)


            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.offsetEncoding = 'utf-8'
            require('lspconfig').clangd.setup {
                capabilities = capabilities
            }

            require 'lspconfig'.slangd.setup {
                filetypes = { "hlsl", "shaderslang", "slang" }
            }
        end,
    },
})
