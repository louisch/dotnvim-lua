local function lsp_attach(_, bufnr)
  local buf_command = vim.api.nvim_buf_create_user_command
  buf_command(bufnr, 'LspFormat', function()
    vim.lsp.buf.format()
  end, {desc = 'Format buffer with language server'})
end

local config = function ()
  require("mason").setup()
  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    end,

    -- Next, you can provide a dedicated handler for specific servers.
    ["grammarly"] = function ()
      require'lspconfig'.grammarly.setup {
        init_options = {
          clientId = require("secrets").GrammarlyClientId
        },
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    end,

    ["sumneko_lua"] = function ()
      require'lspconfig'.sumneko_lua.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
        on_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    end,
  }
end

return {
  config = config
}
