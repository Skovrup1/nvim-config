local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():replace_at(1) end)
vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():replace_at(2) end)
vim.keymap.set("n", "<leader><C-l>", function() harpoon:list():replace_at(3) end)
vim.keymap.set("n", "<leader><C-;>", function() harpoon:list():replace_at(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

harpoon:extend({
    UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })
    end,
})
