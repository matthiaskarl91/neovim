vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim", "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/nvim-neotest/nvim-nio", "https://github.com/marilari88/neotest-vitest",
  "https://github.com/nvim-neotest/neotest" })

require("neotest").setup({
  adapters = {
    require("neotest-vitest"),
  },
})
