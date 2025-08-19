vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

require("lint").linters_by_ft = {
  lua = { "luacheck" },
  python = { "flake8" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  proto = { "buf_lint" },
  nix = { "statix" },
}

require("lint").linters = {
  buf_lint = {
    cmd = "buf",
    args = { "lint", "--path", "$FILENAME" },
    stdin = false,
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
