local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
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
  "jdtls",
}

require("mason").setup({
  lazy = false,
})
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
  lazy = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in pairs(servers) do
  -- silly PR changed tsserver to ts_ls in nvim-lspconfig
  -- this just changes the name so I don't get a warning every time I open nvim
  if server == "tsserver" then
    server = "ts_ls"
  end

  -- set up global 'vim' so you don't get a bunch of LSP warnings in Lua
  if server == "lua_ls" then
    require("lspconfig")[server].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  else
    require("lspconfig")[server].setup {
      capabilities = capabilities
    }
  end
end
