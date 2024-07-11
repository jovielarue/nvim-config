return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()
    local dap, dapui = require("dap"), require("dapui")
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

    vim.keymap.set('n', '<Leader>c', function() require('dap').continue() end)
    vim.keymap.set('n', '<Leader>so', function() require('dap').step_over() end)
    vim.keymap.set('n', '<Leader>si', function() require('dap').step_into() end)
    vim.keymap.set('n', '<Leader>out', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    -- Evaluate variable under cursor
    vim.keymap.set("n", "<space>?", function()
      require("dapui").eval(nil, { enter = true })
    end)
  end,
}
