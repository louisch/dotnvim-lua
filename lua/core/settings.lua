-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd
local opt = vim.opt

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
local function ui()
  opt.ignorecase = true
  opt.smartcase = true
  opt.termguicolors = true
  opt.relativenumber = true
  opt.number = true
  opt.splitright = true
end

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
local function indentation()
  opt.expandtab = true
  opt.shiftwidth = 2
  opt.tabstop = 2
  opt.smartindent = true
end

-----------------------------------------------------------
-- Behavior
-----------------------------------------------------------
local function behavior()
  opt.hidden = true
  opt.lazyredraw = true
  opt.updatetime = 250
  opt.completeopt = 'menu,menuone,preview'
  opt.undofile = true
end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------
local function autocmd()
  -- Remove trailing whitespace on save
  cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

  -- 4 spaces for selected filetypes
  cmd [[
    autocmd FileType python,c,cpp,cs,rust,go setlocal shiftwidth=4 tabstop=4
  ]]

  -- Highlight on yank
  vim.cmd [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]]

  cmd [[
    autocmd BufWritePost ~/.config/nvim/*.lua :lua require("init").reinit()
  ]]
end

local function config()
  ui()
  indentation()
  behavior()
  autocmd()
end

return {
  config = config,
}
