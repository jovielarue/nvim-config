local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "eslint",
  "tailwindcss",
  "kotlin_language_server",
  "intelephense",
  "rust_analyzer",
  "markdown_oxide",
  "sqlls",
  "lemminx",
}

require("mason").setup({
  lazy = false,
})

-- set up flutter/dart tools
require("flutter-tools").setup {} -- use defaults

-- set up java lsp
require('lspconfig').jdtls.setup({})

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
  lazy = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in pairs(servers) do
  -- set up global 'vim' so you don't get a bunch of LSP warnings in Lua
  if server == "lua_ls" then
    require("lspconfig")[server].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      },
      capabilities = capabilities
    }
  else
    require("lspconfig")[server].setup {
      capabilities = capabilities
    }
  end
end
