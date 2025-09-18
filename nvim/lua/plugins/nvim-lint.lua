vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local golangcilint = require("lint").linters.golangcilint
golangcilint.ignore_exitcode = true

require("lint").linters_by_ft = {
  --lua = { "luacheck" },
  python = { "flake8" },
  javascript = { "eslint" },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  proto = { "buf_lint" },
  nix = { "statix" },
  go = { "golangcilint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },
  fish = { "shellcheck" },
}

require("lint").linters.buf_lint = {
  cmd = "buf",
  args = { "lint", "--path", "$FILENAME" },
  stdin = false,
}

local eslint = require("lint").linters.eslint_d
eslint.args = { '--no-warn-ignored', '--format', 'json', '--stdin', '--stdin-filename', function()
  return vim.api.nvim_buf_get_name(0)
end }
eslint.cwd = function()
  return vim.fn.finddir('package.json', ';') or vim.fn.getcwd()
end

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    require("lint").try_lint()
  end,
})
