vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'lua',
    'luadoc',
    'luap',
    'go',
    'gomod',
    'gowork',
    'gosum',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',

  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  parser_install_dir = vim.fn.stdpath('data') .. '/treesitter'
})
