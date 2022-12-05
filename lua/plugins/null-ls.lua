local M = M or {}

M.config = function ()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.diagnostics.eslint,
    },
  })
end

return M
