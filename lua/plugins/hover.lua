return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup {
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        require("hover.providers.diagnostic")
      end,
      preview_opts = {
        border = 'single'
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        'LSP'
      },
      mouse_delay = 1000
    }

    -- Setup keymaps
    vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
  end
}
