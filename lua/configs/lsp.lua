---
-- LSP setup
---
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr,
        --let lsp_zero override mappings
        preserve_mappings = false
    })
    lsp_zero.buffer_autoformat()
end)

--require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- (Optional) configure lua language server
            require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
        end,
    }
})
