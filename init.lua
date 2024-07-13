require("user.options")
require("user.keymaps")
require("user.colorscheme")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- highlight-start
  spec = {
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
  config = function()
    require("lsp")
  end,
})

-- mason must be setup after lazy plugins
require("lsp")
require("dbug")

vim.cmd("packloadall")
