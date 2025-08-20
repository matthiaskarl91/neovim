vim.pack.add({
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/leoluz/nvim-dap-go",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/mfussenegger/nvim-dap",
})


vim.keymap.set('n', '<leader>Dc', function() require('dap').continue() end)                                            -- Debug: Start/Continue
vim.keymap.set('n', '<leader>Dsi', function() require('dap').step_into() end)                                          -- Debug: Step Into
vim.keymap.set('n', '<leader>DsO', function() require('dap').step_over() end)                                          -- Debug: Step Over
vim.keymap.set('n', '<leader>Dso', function() require('dap').step_out() end)                                           -- Debug: Step Out
vim.keymap.set('n', '<leader>Db', function() require('dap').toggle_breakpoint() end)                                   -- Debug: Toggle Breakpoint
vim.keymap.set('n', '<leader>DB', function() require('dap').set_breakpoint(vim.fn.input "Breakpoint condition: ") end) -- Debug: Set Conditional Breakpoint
vim.keymap.set('n', '<leader>Dt', function() require('dap').toggle() end)                                              -- Debug: Toggle UI
vim.keymap.set('n', '<leader>Dl', function() require('dap').run_last() end)                                            -- Debug: Run Last Condition

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
})

dap.listeners.after.event_initalized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

require('nvim-dap-virtual-text').setup()

require('dap-go').setup({
  delve = {
    path = function()
      return vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv"
    end,
  }
})
