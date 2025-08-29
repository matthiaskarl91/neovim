vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local golangcilint = require("lint").linters.golangcilint
golangcilint.ignore_exitcode = true

require("lint").linters_by_ft = {
  --lua = { "luacheck" },
  python = { "flake8" },
  javascript = { "eslint" },
  typescript = { "eslint" },
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

require("lint").linters = {
  buf_lint = {
    cmd = "buf",
    args = { "lint", "--path", "$FILENAME" },
    stdin = false,
  },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})
