local config = function ()
  require("which-key").setup {
    plugins = {
      presets = {
        g = false,
        z = false,
      }
    }
  }
end

return {
  config = config,
}
