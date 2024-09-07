return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    local treesitter_configs = require("nvim-treesitter.configs")
    treesitter_configs.setup({
      ensure_installed = { "json", "yaml", "typescript", "tsx", "html", "lua", "markdown", "markdown_inline", "bash", "python", "javascript", "php", "java", "vimdoc" },
      ignore_install = { " " },
      sync_install = false,

      highlight = {
        enable = true,
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end
}
