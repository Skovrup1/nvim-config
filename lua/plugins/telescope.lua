local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
  },
})

-- Native fzf sorter (built by the PackChanged hook in plugins/init.lua)
pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "Resume last picker" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
