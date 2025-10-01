local servers = {
  "bashls",
  "clangd",
  "cssls",
  "eslint",
  "html",
  "intelephense",
  "jdtls",
  "jsonls",
  "kotlin_language_server",
  "lemminx",
  "lua_ls",
  "markdown_oxide",
  "pylsp",
  "rust_analyzer",
  "sqlls",
  "svelte",
  "tailwindcss",
  "ts_ls",
  "yamlls",
}

require("mason").setup({
  lazy = false,
})

-- set up flutter/dart tools
-- require("flutter-tools").setup {} -- use defaults

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
  automatic_enable = false,
  lazy = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in pairs(servers) do
  -- set up global 'vim' so you don't get a bunch of LSP warnings in Lua
  if server == "lua_ls" then
    vim.lsp.config.lua_ls = {
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
    vim.lsp.config[server] = {
      capabilities = capabilities
    }
  end
end

vim.lsp.enable(servers)
