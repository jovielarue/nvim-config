local prettier = require("prettier")
prettier.setup({
  bin = "prettier", -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "php",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "lua",
    "typescript",
    "typescriptreact",
    "rust",
    "yaml",
  },
})
vim.cmd("let g:prettier#config#single_quote = 'true'")
vim.cmd("let g:prettier#config#trailing_comma = 'all'")
