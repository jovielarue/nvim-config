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
  "jdtls",
  "kotlin_language_server",
  "intelephense",
  "rust_analyzer",
  "markdown_oxide",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.info,
  max_concurrent_installers = 4,
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
  require("lspconfig")[server].setup {
    capabilities = capabilities
  }
end
