local opt = vim.opt

-- Indenting
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.shiftround = true -- Round indent
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 4 -- Number of spaces tabs count for

-- Line numbers
opt.number = true -- Print line number
opt.numberwidth = 1
opt.relativenumber = true -- Relative line numbers
opt.ruler = true

-- Grep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Clipboard
opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- Cursor
opt.mouse = "a" -- Enable mouse mode
opt.cursorline = true -- Enable highlighting of the current line

-- Search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

-- Status
opt.showmode = true

-- Text
opt.spelllang = { "en" }
opt.list = true -- Show some invisible characters (tabs...
opt.wrap = false -- Disable line wrap
opt.termguicolors = true -- True color support

-- Exit
opt.confirm = false -- Confirm to save changes before exiting modified buffer

-- Splitting
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current


opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.formatoptions = "jcroqlnt" -- tcqj
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append({ W = true, I = true, c = true })
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.timeoutlen = 300
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
