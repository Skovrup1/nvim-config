local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation: 4 spaces by default (overridden per-filetype in autocmds.lua)
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false
opt.fillchars = { eob = " " }

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files / persistent undo (pairs with undotree)
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Behaviour
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = "menu,menuone,noselect"
