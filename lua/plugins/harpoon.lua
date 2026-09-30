local harpoon = require("harpoon")

harpoon:setup()

local map = vim.keymap.set

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add file" })

map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon menu" })

for i = 1, 4 do
  map("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Harpoon to file " .. i })
end
