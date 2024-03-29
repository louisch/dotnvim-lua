local config = function ()
  vim.ui.select = function(...)
    require("lazy").load({ plugins = { "dressing.nvim" } })
    return vim.ui.select(...)
  end
  vim.ui.input = function (...)
    require("lazy").load({ plugins = { "dressing.nvim" }})
    return vim.ui.input(...)
  end
end

return {
  config = config,
}
