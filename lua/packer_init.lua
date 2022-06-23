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
  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-treesitter',
    config = function()
      require('nvim-lspconfig')
    end
  }

  -- Tag viewer
  use 'liuchengxu/vista.vim'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  --use 'hrsh7th/cmp-copilot'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function ()
      vim.schedule(function() require("copilot") end)
    end
  }
  use {
      "zbirenbaum/copilot-cmp",
      after = {"copilot.lua", "nvim-cmp"},
  }

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
