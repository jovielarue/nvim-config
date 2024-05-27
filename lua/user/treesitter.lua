local M = {}

function M.config()
  local treesitter = require("nvim-treesitter")
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "javascript" },
    ignore_install = { " " },
    sync_install = false,

    highlight = {
      enable = true,
      disable = { "css" },
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

return M
