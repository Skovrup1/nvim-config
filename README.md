# Neovim config

Lean Neovim 0.12 config using the built-in `vim.pack` plugin manager (no Mason,
no external plugin manager). LSP servers are installed system-wide.

## Requirements

- Neovim **0.12+**
- `git`, a C compiler (`gcc`/`clang`), and the **`tree-sitter` CLI** — the
  nvim-treesitter `main` branch builds parsers with it (`pacman -S tree-sitter-cli`)
- A Nerd Font (for completion/diagnostic icons)

## Install LSP servers (Arch Linux)

Official repos:

```sh
sudo pacman -S lua-language-server rust-analyzer haskell-language-server clang ruff tree-sitter-cli
```

- `clang` provides `clangd` (C/C++)
- `rust-analyzer` can alternatively be managed via `rustup component add rust-analyzer`

AUR (use `yay` / `paru`):

```sh
yay -S ols basedpyright   # Odin LSP + Python LSP
```

## First launch

On the first `nvim` start, `vim.pack` clones every plugin and the `PackChanged`
hook runs `:TSUpdate` and builds `telescope-fzf-native`. blink.cmp downloads its
prebuilt fuzzy binary (pinned release `v1.10.2`). Restart once when it finishes.

Update plugins later with `:lua vim.pack.update()`.

## Layout

```
init.lua                 entry point, sets leader, loads core + plugins
lua/core/
  options.lua            editor options
  keymaps.lua            general (non-plugin) keymaps
  autocmds.lua           yank highlight, trim whitespace, cursor restore, indent
lua/plugins/
  init.lua               vim.pack specs + build hooks + module loading
  theme.lua              rose-pine
  treesitter.lua         nvim-treesitter (master branch / classic API)
  telescope.lua          fuzzy finder + fzf-native
  harpoon.lua            file pinning (harpoon2)
  undotree.lua           undo history visualizer
  gitsigns.lua           git gutter + hunk actions
  completion.lua         blink.cmp
  lsp.lua                native LSP config, diagnostics, on-attach keymaps
  whichkey.lua           keymap discovery
```

## Key bindings

Leader is `<Space>`.

| Key | Action |
| --- | --- |
| `<leader>ff` / `fg` / `fb` | find files / live grep / buffers |
| `<leader>fd` / `fr` / `fw` | diagnostics / resume / grep word |
| `<leader>a` / `<C-e>` | harpoon add / menu |
| `<leader>1..4` | jump to harpoon file |
| `<leader>u` | toggle undotree |
| `]c` / `[c` | next / prev git hunk |
| `<leader>hs` / `hr` / `hp` / `hb` / `hd` | stage / reset / preview hunk, blame, diff |
| `gd` `gr` `gi` `K` | LSP definition / refs / impl / hover |
| `<leader>rn` / `ca` / `f` | rename / code action / format |
| `[d` / `]d` | prev / next diagnostic |
| `<S-h>` / `<S-l>` | prev / next buffer |
| `<C-h/j/k/l>` | window navigation |
```
