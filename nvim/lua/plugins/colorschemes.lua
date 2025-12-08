vim.pack.add({ "http://github.com/folke/tokyonight.nvim.git" })
vim.pack.add({ "https://github.com/p00f/alabaster.nvim" })

require("tokyonight").setup({
  transparent = true
})

vim.cmd [[colorscheme tokyonight]]
--vim.cmd [[colorscheme alabaster]]
