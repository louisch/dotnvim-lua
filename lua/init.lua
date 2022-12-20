local init = function ()
  require("packer_init").config()

  require("core/settings").config()
  require("core/keymaps").config()
  require("core/colors").config()
end

local function reinit()
  require("packer_init").config()

  require("core/settings").config()
  require("core/keymaps").config()
end

return {
  init = init,
  reinit = reinit,
}
