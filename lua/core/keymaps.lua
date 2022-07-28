-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

-- Change leader to space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require("which-key")

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting
wk.register({
  zz = {
    function()
      vim.api.nvim_command("nohlsearch")
    end,
    "Clear search highlighting",
  },
}, { mode = "n" })

wk.register({
  tt = {
    function()
      vim.api.nvim_command("NvimTreeToggle")
    end,
    "Toggle NvimTree"
  },
  tn = {
    function()
      vim.api.nvim_command("tabnext")
    end,
    "Go to next tab"
  },
  tp = {
    function()
      vim.api.nvim_command("tabprev")
    end,
    "Go to previous tab"
  }
}, { prefix = "<leader>" })

-- Abbreviation for vertical help
vim.cmd('cnoreabbrev H vert h')
