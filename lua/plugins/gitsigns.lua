local config = function ()
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

return {
  config = config,
}
