local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')
return packer.startup(function()
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
  use 'neovim/nvim-lspconfig'

  -- Tag viewer
  use 'liuchengxu/vista.vim'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-copilot'
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
    config = function()
      require('Comment').setup()
    end
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use 'simrat39/rust-tools.nvim'

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Colorscheme
  use "EdenEast/nightfox.nvim"
end)