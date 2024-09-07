local dap, dapui = require("dap"), require("dapui")
require("dapui").setup({})
require("nvim-dap-virtual-text").setup()

-- Auto dapui open/close with keymaps
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
