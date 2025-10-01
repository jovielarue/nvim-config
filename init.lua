require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.autocmds")
vim.cmd("source ~/.config/nvim/vim/alias.vim")

-- install lazy.nvim if it does not exist
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
  checker = { enabled = false },
  config = function()
    require("lsp")
  end,
})

-- mason must be setup after lazy plugins
require("lsp")

vim.cmd("packloadall")

-- getting rid of rust lsp errors
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

vim.cmd("highlight DiagnosticUnderlineError guifg=#FF0000 gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn guifg=#FFF000 gui=undercurl")
vim.lsp.document_color.enable(true, 0, { style = 'foreground' })
