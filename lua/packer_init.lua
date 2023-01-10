local function packer_config(use)
  use {
    'wbthomason/packer.nvim', -- packer can manage itself
  }

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    require = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = require('nvim-tree').config,
    tag = 'nightly',
  }

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

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
    requires = "simrat39/rust-tools.nvim",
  }
  use "simrat39/rust-tools.nvim"

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
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/nvim-cmp',
    config = require("plugins/nvim-cmp").config,
    requires = "L3MON4D3/LuaSnip",
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
    end,
    rocks = { 'jsregexp' },
    requires = "rafamadriz/friendly-snippets",
  }

  -- "gc" to comment visual regions/lines
  use {
    'numToStr/Comment.nvim',
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
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
  use {
    'f-person/git-blame.nvim'
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
end

local function config()
  vim.cmd [[packadd packer.nvim]]

  local packer = require('packer')
  return packer.startup(packer_config)
end

return {
  config = config,
}
