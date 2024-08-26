require("dbug.jdtls")
-- --- js debugger setup ---
-- require("dap").adapters["pwa-node"] = {
--   type = "server",
--   host = "::1",
--   port = "${port}",
--   executable = {
--     command = "node",
--     args = { "~/.debuggers/js-debug/src/dapDebugServer.js", "${port}" },
--   }
-- }
-- require("dap").configurations.javascript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
-- }
-- --- end js debugger setup ---
--
-- require("dapui").setup({})
-- require("nvim-dap-virtual-text").setup()
-- local dap, dapui = require("dap"), require("dapui")
-- -- dap.listeners.before.attach.dapui_config = function()
-- --   dapui.open()
-- -- end
-- -- dap.listeners.before.launch.dapui_config = function()
-- --   dapui.open()
-- -- end
-- -- dap.listeners.before.event_terminated.dapui_config = function()
-- --   dapui.close()
-- -- end
-- -- dap.listeners.before.event_exited.dapui_config = function()
-- --   dapui.close()
-- -- end
vim.keymap.set('n', '<Leader>c', function() dap.continue() end)
vim.keymap.set('n', '<Leader>so', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>si', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>out', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
