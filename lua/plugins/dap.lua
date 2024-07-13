-- config in dap/init.lua
return {
  "mfussenegger/nvim-dap",
  "mxsdev/nvim-dap-vscode-js",
  "mfussenegger/nvim-dap-ui",
  "thehamsta/nvim-dap-virtual-text",
  build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
}
