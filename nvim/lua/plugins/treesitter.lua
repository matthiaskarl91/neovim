vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath('data') .. '/treesitter'
})

--require("nvim-treesitter").setup({
--  ensure_installed = {
--   'lua',
-- 'luadoc',
-- 'luap',
--'go',
-- 'gomod',
--  'gowork',
--  'gosum',
--  'graphql',
--  'tsx',
--  'typescript',
--  'vim',
--  'vimdoc',
-- },
-- auto_install = false,
-- highlight = {
--   enable = true,
--   additional_vim_regex_highlighting = false,
-- },
-- indent = {
--   enable = true,
-- },
-- install_dir = vim.fn.stdpath('data') .. '/treesitter'
--})
