local config = function ()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      config = require('plugins/nvim-tree').config,
      tag = 'nightly',
    },

    'nvim-tree/nvim-web-devicons',

    -- Treesitter interface
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects'
      },
      cmd = 'TSUpdate',
      config = require("plugins/nvim-treesitter").config,
    },

    -- LSP
    {
      "williamboman/mason.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "simrat39/rust-tools.nvim",
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = require("plugins/mason").config,
      dependencies = {
        "williamboman/mason.nvim",
      },
    },

    -- DAP
    'mfussenegger/nvim-dap',

    -- Linter/Formatter
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = require("plugins/null-ls").config,
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = require("plugins/trouble").config,
    },

    -- Completion
    {
      'hrsh7th/cmp-nvim-lsp',
      version = nil,
      dependencies = {
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
      },
      config = require("plugins/nvim-cmp").config,
    },
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },

    -- Autopairs
    {
      'windwp/nvim-autopairs',
      config = require("plugins/nvim-autopairs").config,
    },

    -- Snippets
    {
      'L3MON4D3/LuaSnip',
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      rocks = { 'jsregexp' },
      dependencies = "rafamadriz/friendly-snippets",
    },

    -- "gc" to comment visual regions/lines
    {
      'numToStr/Comment.nvim',
      config = require('plugins/comment-nvim').config,
    },

    -- Statusline
    {
      'famiu/feline.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
      config = require("plugins/feline").config,
    },

    -- git
    {
      'lewis6991/gitsigns.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = require("plugins/gitsigns").config,
    },
    {
      'TimUntersberger/neogit',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('neogit').setup {}
      end,
    },
    'f-person/git-blame.nvim',

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Colorscheme
    "rmehri01/onenord.nvim",

    -- which-key
    {
      "folke/which-key.nvim",
      config = require("plugins/which-key").config,
    },

    -- undotree
    "mbbill/undotree",

    -- Highlight all usages of a symbol
    {
      "RRethy/vim-illuminate",
      config = require("plugins/vim-illuminate").config,
    },

    {
      "stevearc/dressing.nvim",
      config = require("plugins/dressing-nvim").config,
    },

    "akinsho/bufferline.nvim",

    "rcarriga/nvim-notify",
  })
end

return {
  config = config,
}
