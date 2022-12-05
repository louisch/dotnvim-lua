local M = M or {}

M.config = function ()
  require('gitsigns').setup {
    signs = {
      add = { text = '▊' },
      change = { text = '▊' },
      delete = { text = '▁'},
      topdelete = { text = '▔'},
      changedelete = { text = '▒' },
    }
  }
end

return M
