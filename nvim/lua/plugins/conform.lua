vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua " },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    --yaml = { "yamlfmt" },
    python = { "black" },
    nix = { "nixpkgs_fmt" },
    proto = { "buf" },
    rust = { "rustfmt" },
    graphql = { "prettier" },
    go = { "gofmt" },
  },
  formatters = {
    prettier = {
      command = "prettier",
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
    },
  },
})
