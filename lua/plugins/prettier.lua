return {
  "MunifTanjim/prettier.nvim",

  config = function()
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
        "markdown",
        "less",
        "scss",
        "lua",
        "typescript",
        "typescriptreact",
        "rust",
        "yaml",
        "google-java-format",
      },
    })
    vim.cmd("let g:prettier#config#single_quote = 'true'")
    vim.cmd("let g:prettier#config#trailing_comma = 'all'")
  end
}
