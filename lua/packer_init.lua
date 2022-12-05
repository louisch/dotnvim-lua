local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = require('nvim-tree').config,
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    use 'nvim-treesitter/nvim-treesitter-textobjects',
    run = ':TSUpdate',
    config = require("plugins/nvim-treesitter").config,
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      config = require("plugins/mason").config,
      require = {"williamboman/mason.nvim"}
    },
    "neovim/nvim-lspconfig",
  }

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- Linter/Formatter
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = require("plugins/null-ls").config,
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = require("plugins/trouble").config,
  }

  -- Tag viewer
  use 'liuchengxu/vista.vim'

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    config = require("plugins/nvim-cmp").config,
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = require("plugins/nvim-autopairs").config,
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
  use 'saadparwaiz1/cmp_luasnip'

  -- "gc" to comment visual regions/lines
  use {
    'numToStr/Comment.nvim',
  }

  -- Rust support
  use 'simrat39/rust-tools.nvim'

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require("plugins/feline").config,
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require("plugins/gitsigns").config,
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup {}
    end,
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Colorscheme
  use "rmehri01/onenord.nvim"

  -- which-key
  use {
    "folke/which-key.nvim",
    config = require("plugins/which-key").config,
  }

  -- undotree
  use {
    "mbbill/undotree"
  }

  use {
    'f-person/git-blame.nvim'
  }
end)
