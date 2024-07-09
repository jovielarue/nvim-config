vim.g.mapleader = " "

-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Switch tabs easily
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", opts)

-- Set page up/down to center cursor vertically
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

-- Set <C-w> to <C-w><C-w> so I don't have to press it twice
-- It pauses for a second before completing so I commented it out until I find a fix
-- vim.keymap.set("n", "<C-w>", "<C-w><C-w>", opts)

-- Start Oil (file explorer)
vim.keymap.set("n", "e", ":Oil<CR>", opts)

-- commented in lieu of vim-tmux-navigator
-- -- Hint: see `:h vim.map.set()`
-- -- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
-- vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
-- vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
-- vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)


---------------
-- Debugging --
---------------
vim.keymap.set('n', '<Leader>c', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>so', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>si', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>out', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>bb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
