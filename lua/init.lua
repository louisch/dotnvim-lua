local init = function ()
  require("core/settings").config() -- must be loaded before packages because termguicolors is set, which feline needs
  require("lazy-nvim").config()
  require("core/keymaps").config() -- must be loaded after packages because which-key is used
  require("core/colors").config()
end

local function reinit()
  require("core/settings").config()
  require("core/keymaps").config()
end

return {
  init = init,
  reinit = reinit,
}
