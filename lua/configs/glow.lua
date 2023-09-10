vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.md",
    callback = function(args)
        vim.keymap.set('n', '<leader>lv', '<cmd>Glow<CR>', { buffer = args.buf })
    end
})

require("glow").setup({
})
