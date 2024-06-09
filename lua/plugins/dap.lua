return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require('dap')
        dap.configurations.python = {
          {
            type = 'python',
            request = 'launch',
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
              return '/usr/bin/python'
            end,
          },
        }

        require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
      end
    },
    "nvim-neotest/nvim-nio",
  },
  config = {}
}
