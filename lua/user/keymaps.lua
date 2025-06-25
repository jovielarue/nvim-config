vim.g.mapleader = " "

-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Leader Keys --

vim.keymap.set("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- Git Blame
vim.keymap.set("n", "<Leader>b", ":BlamerToggle<CR>", opts)

-- Switch tabs easily
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", opts)

-- Switch windows easily
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Set page up/down to center cursor vertically
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

-- Start Oil (file explorer)
vim.keymap.set("n", "e", ":Oil<CR>", opts)


-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

-----------------
-- Insert Mode --
-----------------

-----------------
-- Visual mode --
-----------------

-- Indents while keeping text selected
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
