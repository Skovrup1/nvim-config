local wk = require("which-key")

wk.setup({})

-- Group labels for the leader menu
wk.add({
  { "<leader>c", group = "code" },
  { "<leader>f", group = "find" },
  { "<leader>h", group = "git hunk" },
})
