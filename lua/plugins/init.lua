-- Plugin management via Neovim 0.12 built-in vim.pack.
-- No lazy-loading: plugins load at startup (this config is small enough that
-- startup stays well under ~50ms).

vim.pack.add({
  -- Theme
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },

  -- Treesitter (`main` branch / rewrite — required for Neovim 0.12 compat;
  -- the `master` branch crashes on injection predicates under 0.12)
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- LSP server configurations (used via native vim.lsp.enable)
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Completion (release tag => prebuilt fuzzy binary is downloaded, no cargo build)
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },

  -- Fuzzy finder
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

  -- File pinning / quick navigation
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

  -- Undo history visualizer
  { src = "https://github.com/mbbill/undotree" },

  -- Git gutter signs
  { src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- Keymap discovery
  { src = "https://github.com/folke/which-key.nvim" },
})

-- vim.pack has no build hooks, so run them ourselves when a plugin is
-- installed or updated.
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("pack_build", { clear = true }),
  callback = function(ev)
    local data = ev.data
    if data.kind == "delete" then
      return
    end
    local name = data.spec and data.spec.name or ""
    local src = data.spec and data.spec.src or ""

    if name:match("nvim%-treesitter") or src:match("nvim%-treesitter") then
      vim.cmd("TSUpdate")
    elseif src:match("telescope%-fzf%-native") then
      vim.system({ "make" }, { cwd = data.path })
    end
  end,
})

-- Load configuration modules
require("plugins.theme")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.undotree")
require("plugins.gitsigns")
require("plugins.completion")
require("plugins.lsp")
require("plugins.whichkey")
