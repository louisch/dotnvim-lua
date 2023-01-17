-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local wk = require("which-key")

local config = function ()
  -- Change leader to space
  vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -----------------------------------------------------------
  -- Neovim shortcuts
  -----------------------------------------------------------

  -- config
  wk.register({
    sl = {
      function ()
        vim.api.nvim_command("luafile %")
      end,
      "Source luafile"
    },
  }, { prefix = "<leader>" })

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
    },

    ["do"] = {
      vim.diagnostic.open_float,
      "Open Diagnostics"
    },
    dp = {
      vim.diagnostic.goto_prev,
      "Diagnostics goto prev"
    },
    dn = {
      vim.diagnostic.goto_next,
      "Diagnostics goto next"
    },
    dq = {
      vim.diagnostic.setloclist,
      "Diagnostics setloclist"
    },

    gd = {
      vim.lsp.buf.definition,
      "Go to definition",
    },
    gD = {
      vim.lsp.buf.declaration,
      "Go to declaration",
    },
    gi = {
      vim.lsp.buf.implementation,
      "Go to implementation",
    },
    gr = {
      vim.lsp.buf.references,
      "Go to references",
    },

    kh = {
      vim.lsp.buf.hover,
      "See hover information",
    },
    ks = {
      vim.lsp.buf.signature_help,
      "See signature help",
    },
    kt = {
      vim.lsp.buf.type_definition,
      "See type definition",
    },

    wa = {
      vim.lsp.buf.add_workspace_folder,
      "Add workspace folder",
    },
    wr = {
      vim.lsp.buf.remove_workspace_folder,
      "Remove workspace folder",
    },
    wl = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    cr = {
      vim.lsp.buf.rename,
      "Rename symbol",
    },
    cf = {
      function()
        vim.lsp.buf.format({ async = true})
      end,
      "Format buffer",
    },
    ca = {
      vim.lsp.buf.code_action,
      "Code Action",
    },
  }, { prefix = "<leader>" })

  -- Abbreviation for vertical help
  vim.cmd('cnoreabbrev H vert h')
end

return {
  config = config,
}
