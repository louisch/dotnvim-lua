-- Configure buffer-local keymaps for LSP actions
local wk = require("which-key")
local on_attach = function(_, buffer)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    ["<leader>g"] = {
      name = "LSP: Go to",
      D = { function() vim.lsp.buf.declaration() end, "Go to definition" },
      d = { function() vim.lsp.buf.definition() end, "Go to declaration" },
      i = { function() vim.lsp.buf.implementation() end, "Go to implementation" },
      r = { function() vim.lsp.buf.references() end, "Find references" },
      t = { function() vim.lsp.buf.type_definition() end, "Go to type definition" },
    },
    ["<leader>i"] = {
      name = "LSP: Display information",
      h = { function() vim.lsp.buf.hover() end, "Display hover information" },
      s = { function() vim.lsp.buf.signature_help() end, "Display signature information" },
    },
    ["<leader>w"] = {
      name = "LSP: Workspace Commands",
      a = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
      r = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
      l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
    },
    ["<leader>c"] = {
      name = "LSP: Edit",
      n = { function() vim.lsp.buf.rename() end, "Rename symbol" },
      a = { function() vim.lsp.buf.code_action() end, "Code action" },
      f = { function() vim.lsp.buf.formatting() end, "Format buffer" },
    },
  }, { buffer = buffer })
end

-- Integrate nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Configure LSP servers
--
local lspconfig = require('lspconfig')

local servers = {
  'cssls',
  'html',
  'svelte',
  'tailwindcss',
  'tsserver',
  'vuels',

  'pyright',
  'rust_analyzer',
  'gopls',

  'remark_ls',
  'jsonls',
  'yamlls',
}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json"),
}

-- Configure Lua LSP separately

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
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
}


-- LSP Installer
require("nvim-lsp-installer").setup {
  ensure_installed = {
    "awk_ls",
    "bashls",
    "ccls",
    "cssls",
    "dockerls",
    "eslint",
    "gopls",
    "hls",
    "intelephense",
    "marksman",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "sumneko_lua",
    "svelte",
    "texlab",
    "tflint",
    "tsserver",
    "volar",
    "yamlls",
  },
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  },
}

