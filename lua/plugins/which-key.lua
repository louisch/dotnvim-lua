local M = {}

M.config = function ()
  require("which-key").setup {
    plugins = {
      presets = {
        g = false,
        z = false,
      }
    }
  }
end

return M
