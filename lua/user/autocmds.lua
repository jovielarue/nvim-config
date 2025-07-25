-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
--- from https://github.com/brainfucksec/neovim-lua

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
  end
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})
