-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

--vim.keymap.set("n", "<leader>fgi",builtin.git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search by grep" })
--vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })

vim.keymap.set("n", "<leader>fz", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })
