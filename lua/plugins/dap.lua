return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"
    local ui = require "dapui"

    ui.setup()
    require("nvim-dap-virtual-text").setup({})
    require("dap-python").setup("python")
    -- If using the above, then `python -m debugpy --version`
    -- must work in the shell

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/usr/bin/codelldb',
        args = { "--port", "${port}" },
      }
    }

    dap.configurations.rust = {
      {
        name = "Rust debug",
        type = "codelldb",
        showDisassembly = "never",
        request = "launch",
        program = function()
          vim.fn.jobstart('cargo build')
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
      },
    }
    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/alacritty',
      args = { '-e' },
    }


    vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<space>duc", dap.run_to_cursor)

    -- Eval var under cursor
    vim.keymap.set("n", "<space>d?", function()
      require("dapui").eval(nil, { enter = true })
    end)
    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F6>", dap.restart)


    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end
}
