-- Formatter compatible with many different formatting engines
return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      event = { "BufReadPre", "BufNewFile" },
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        java = { "google-java-format" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        python = { "isort", "black" },
        kotlin = { "ktfmt" },
      },
      format_on_save = { lsp_fallback = true, async = false, timeout_ms = 1000 },
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
      end, { desc = "Format file or range (in visual mode)" })
    })
  end
}
