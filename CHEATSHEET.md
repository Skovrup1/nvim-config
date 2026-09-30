# Neovim Cheatsheet

Reference for going beyond basic line-editing motions. Top half = your
configured keymaps (leader is `<Space>`). Bottom half = advanced vanilla Vim
worth learning.

---

## Your config keymaps

### Windows & buffers
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move to window left/down/up/right |
| `<S-l>` / `<S-h>` | Next / previous buffer |
| `<leader>p` (visual) | Paste over selection without clobbering register |
| `<Esc>` | Clear search highlight |

### Movement niceties (auto-centering)
| Key | Action |
|-----|--------|
| `<C-d>` / `<C-u>` | Half-page down/up, cursor stays centered |
| `n` / `N` | Next/prev search match, centered |
| `J` / `K` (visual) | Move selected lines down / up |

### Telescope — fuzzy finder (`<leader>f…`)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search file contents) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Diagnostics |
| `<leader>fr` | Resume last picker |
| `<leader>fw` | Grep word under cursor |

*Inside a picker:* `<C-n>/<C-p>` next/prev, `<C-x>` open in split, `<C-v>`
vsplit, `<C-t>` new tab, `<C-q>` send results to quickfix, `<C-/>` show
mappings.

### Harpoon — pinned files
| Key | Action |
|-----|--------|
| `<leader>a` | Pin current file |
| `<C-e>` | Toggle quick menu |
| `<leader>1`–`<leader>4` | Jump to pinned file 1–4 |

*In the menu you can reorder/delete lines like a normal buffer, then `:w`/`q`.*

### LSP (active once a server attaches)
| Key | Action |
|-----|--------|
| `gd` / `gD` | Goto definition / declaration |
| `gr` | References |
| `gi` | Goto implementation |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `[d` / `]d` | Prev / next diagnostic (with float) |

Servers enabled: `lua_ls`, `rust_analyzer`, `hls`, `clangd`, `ols`,
`ruff`, `basedpyright`.

### Completion — blink.cmp (insert mode)
| Key | Action |
|-----|--------|
| `<C-space>` | Open menu |
| `<C-y>` | Accept |
| `<C-n>` / `<C-p>` | Select next / prev |
| `<C-e>` | Hide menu |
| `<C-k>` | Toggle docs |

### Git — gitsigns (`<leader>h…`)
| Key | Action |
|-----|--------|
| `]c` / `[c` | Next / prev change hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line (full) |
| `<leader>hd` | Diff this file |

### Other
| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undotree |

*Forgot a leader mapping? Press `<Space>` and wait — which-key shows the menu.*

---

## Advanced vanilla Vim

### Buffers, windows, tabs
| Command | Action |
|---------|--------|
| `:ls` / `:buffers` | List buffers |
| `:b <name/num>` | Jump to buffer (tab-completes) |
| `:bd` | Delete (close) buffer |
| `<C-^>` | Toggle to previously-edited buffer |
| `:sp` / `:vs` | Horizontal / vertical split |
| `<C-w>q` / `<C-w>o` | Close window / close all others |
| `<C-w>=` | Equalize window sizes |
| `<C-w>_` / `<C-w>|` | Max height / width |
| `<C-w>r` | Rotate windows |
| `gt` / `gT` | Next / prev tab |
| `:tabnew` | New tab |

### Macros
1. `q<letter>` — start recording into register `<letter>`
2. perform your edits
3. `q` — stop recording
4. `@<letter>` — replay; `@@` — replay last
5. `5@<letter>` — replay 5×; or visual-select lines + `:normal @<letter>`

*Tip:* macros store into registers, so `"ap` pastes a macro's text to edit it,
and `"ayy` yanks an edited line back into register `a`.

### Registers
| Key | Action |
|-----|--------|
| `"ayy` / `"ap` | Yank/paste via named register `a` |
| `"+y` / `"+p` | System clipboard (you also have `clipboard=unnamedplus`, so plain `y`/`p` already use it) |
| `"0p` | Paste last *yank* (survives deletes) |
| `"_d` | Delete into black hole (no register clobber) |
| `:reg` | View all registers |
| `<C-r>a` (insert) | Insert register `a` inline |

### Text objects (combine with `d`/`c`/`y`/`v`)
| Object | Meaning |
|--------|---------|
| `iw` / `aw` | Inner / a word |
| `ip` / `ap` | Inner / a paragraph |
| `i"` `i'` `` i` `` | Inside quotes |
| `i(` `i{` `i[` `i<` | Inside brackets (also `ib`/`iB`) |
| `it` / `at` | Inside / around HTML/XML tag |
| `is` / `as` | Inner / a sentence |

Example: `ci"` change inside quotes, `dap` delete a paragraph, `ya{` yank a block.
With treesitter installed you also get syntax-aware highlighting under all this.

### Marks & jumps
| Key | Action |
|-----|--------|
| `ma` | Set mark `a` (uppercase = cross-file) |
| `` `a `` / `'a` | Jump to mark (exact / line) |
| `` `` `` | Back to position before last jump |
| `<C-o>` / `<C-i>` | Jump list backward / forward |
| `g;` / `g,` | Older / newer change position |
| `:marks` | List marks |

### Search & replace
| Command | Action |
|---------|--------|
| `*` / `#` | Search word under cursor fwd / back |
| `:%s/old/new/g` | Replace in whole file |
| `:%s/old/new/gc` | …with confirm each |
| `:s/old/new/g` | Current line only |
| `:'<,'>s/…` | Within visual selection |
| `&` | Repeat last `:s` |
| `gn` | Select next search match as a text object (e.g. `cgn` then `.`) |

### Quickfix & location list
| Command | Action |
|---------|--------|
| `:copen` / `:cclose` | Open / close quickfix |
| `:cnext` / `:cprev` | Next / prev entry |
| `:cdo s/old/new/g` | Run substitution across all quickfix files |
| `:grep <pat>` | Populate quickfix (or send Telescope results with `<C-q>`) |

Workflow: Telescope grep → `<C-q>` → `:cdo s/…/…/g | update` = project-wide
find-and-replace.

### The dot command & repeats
- `.` repeats your last change — the most powerful editing tool. Make edits
  `.`-repeatable: prefer `ciw`+`.` over manual retyping.
- `;` / `,` repeat last `f`/`t` motion forward / backward.
- `f` `t` `F` `T` — jump to char on line; pair with operators: `dt;` delete to `;`.

### Insert-mode power
| Key | Action |
|-----|--------|
| `<C-r>"` | Paste register while inserting |
| `<C-w>` / `<C-u>` | Delete word / line backward |
| `<C-a>` | Reinsert last inserted text |
| `<C-o>cmd` | Run one normal-mode command, return to insert |

### Visual & block
| Key | Action |
|-----|--------|
| `<C-v>` | Visual block (column) select |
| `I` / `A` (in block) | Insert before / append after on every line |
| `gv` | Reselect last visual selection |
| `o` | Jump to other end of selection |
| `=` | Auto-indent selection |
| `g<C-a>` | Visual-block: make a sequence of incrementing numbers |

### Folds, formatting, misc
| Key | Action |
|-----|--------|
| `zf` / `za` | Create fold / toggle fold |
| `gq` (motion) | Reformat/wrap text |
| `gU` / `gu` / `g~` (motion) | Upper / lower / toggle case |
| `<C-a>` / `<C-x>` | Increment / decrement number under cursor |
| `gx` | Open URL/file under cursor |
| `g_` | Last non-blank char of line |
| `:earlier 5m` / `:later 5m` | Time-travel undo (pairs with undotree) |

---

*Self-discovery: `:Telescope keymaps`, `:map`, `:verbose map <key>` to see what
a key is bound to and where.*
