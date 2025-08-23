-- Shows indent depths with pretty colors
return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local highlight = {
      "Purple",
      "LightPink",
      "Pink",
      "LightBlue",
      "Blue",
      "Dark",
    }
    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Purple", { fg = "#695575" })
      vim.api.nvim_set_hl(0, "LightPink", { fg = "#6F4555" })
      vim.api.nvim_set_hl(0, "Pink", { fg = "#987D87" })
      vim.api.nvim_set_hl(0, "Lightblue", { fg = "#62819D" })
      vim.api.nvim_set_hl(0, "Blue", { fg = "#3B6387" })
      vim.api.nvim_set_hl(0, "Dark", { fg = "#454F4D" })
    end)

    require("ibl").setup({
      indent = { highlight = highlight },
      scope = { enabled = true }
    })
  end
}
