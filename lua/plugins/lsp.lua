-- Native Neovim 0.12 LSP. nvim-lspconfig ships per-server defaults under its
-- `lsp/` directory which vim.lsp.enable() picks up automatically. No Mason:
-- servers are installed system-wide (see README.md).

-- Diagnostics UI
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

-- Completion capabilities advertised to every server
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Per-server overrides
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "hls",
  "clangd",
  "ols",
  "pyright",
  "ruff",
})

-- Buffer-local keymaps once a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(ev)
    local function map(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    map("gr", vim.lsp.buf.references, "References")
    map("gi", vim.lsp.buf.implementation, "Goto implementation")
    map("K", vim.lsp.buf.hover, "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")
    map("[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, "Prev diagnostic")
    map("]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, "Next diagnostic")
  end,
})
