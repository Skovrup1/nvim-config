-- nvim-treesitter `main` branch API. Unlike the old `master` branch there is no
-- `.configs.setup({ highlight = ... })`; parsers are installed explicitly and
-- highlighting/indent are started per-buffer.

local parsers = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "rust",
  "haskell",
  "c",
  "cpp",
  "odin",
  "python",
  "markdown",
  "markdown_inline",
  "bash",
  "json",
  "toml",
}

-- Install any missing parsers (async; a no-op once they are present).
require("nvim-treesitter").install(parsers)

-- Start treesitter highlighting + indentation for any buffer whose filetype
-- has an available parser.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(args)
    local buf = args.buf
    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
    if not lang then
      return
    end
    -- pcall guards filetypes whose parser isn't installed yet.
    if not pcall(vim.treesitter.start, buf, lang) then
      return
    end
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
