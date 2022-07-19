local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use {
    'neovim/nvim-lspconfig',
    after = {'nvim-treesitter', 'nvim-lsp-installer'},
    config = function()
      require('plugins/nvim-lspconfig')
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Tag viewer
  use 'liuchengxu/vista.vim'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
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
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
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
  }
end)
