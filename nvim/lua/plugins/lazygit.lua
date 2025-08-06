vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim", "https://github.com/kdheepak/lazygit.nvim" })

vim.keymap.set("n", "<leader>gg", function()
  require("lazygit").lazygit()
end, { desc = "Open LazyGit" })
