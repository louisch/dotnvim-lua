local config = function ()
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  require("nvim-tree").setup {
    open_on_setup = false,
    view = {
      hide_root_folder = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
        resize_window = true,
      },
    },
  }
end

return {
  config = config,
}
