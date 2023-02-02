local config = function ()
  require("trouble").setup {}

  local wk = require("which-key")

  wk.register({
    x = {
      name = "Trouble",
      x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble (Workspace Diagnostics)" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble (Document Diagnostics)" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Trouble (loclist)" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble (Quick Fixes)" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble (References)" },
    },
  }, { prefix = "<leader>" })
end

return {
  config = config,
}
