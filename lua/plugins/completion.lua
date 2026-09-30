require("blink.cmp").setup({
  -- default preset: <C-space> open, <C-y> accept, <C-n>/<C-p> select,
  -- <C-e> hide, <C-k> toggle docs.
  keymap = { preset = "default" },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  -- Uses the prebuilt Rust binary downloaded with the v1.10.2 release tag.
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
