-- Leader must be set before any plugins/keymaps are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("plugins")
