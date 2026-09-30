require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Navigation between hunks
    map("n", "]c", function()
      gs.nav_hunk("next")
    end, "Next hunk")
    map("n", "[c", function()
      gs.nav_hunk("prev")
    end, "Prev hunk")

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, "Blame line")
    map("n", "<leader>hd", gs.diffthis, "Diff this")
  end,
})
