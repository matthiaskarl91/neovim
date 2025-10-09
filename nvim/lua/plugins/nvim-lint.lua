vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

local lint = require("lint")

local golangcilint = require("lint").linters.golangcilint
golangcilint.ignore_exitcode = true


--[[lint.linters_by_ft = {
  --lua = { "luacheck" },
  python = { "flake8" },
  javascript = { "eslint_d" },
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
}]]
lint.linters_by_ft = {
  --lua = { "luacheck" },
  python = { "flake8" },
  javascript = { "eslint_d" },
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

local eslint = lint.linters.eslint_d

eslint.args = {
  "--no-warn-ignored", -- <-- this is the key argument
  "--format",
  "json",
  "--stdin",
  "--stdin-filename",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    local linters = lint.linters_by_ft[vim.bo.filetype]
    if linters and #linters > 0 then
      -- check if eslint config exists
      if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
        local eslintConfigFilenames = {
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
          "eslint.config.ts",
          "eslint.config.mts",
          "eslint.config.cts",
          ".eslintrc.js",
          ".eslintrc.json",
          ".eslintrc.cjs",
        }
        if vim.fs.root(0, eslintConfigFilenames) == nil then
          return
        end
      end
      lint.try_lint()
    end
  end
})

-- Manual linting command
vim.keymap.set("n", "<leader>lll", function()
  lint.try_lint()
  vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
end, { desc = "Trigger linting for current file" })

-- Show linter status
vim.keymap.set("n", "<leader>li", function()
  local linters = lint.linters_by_ft[vim.bo.filetype] or {}
  if #linters == 0 then
    print("No linters configured for filetype: " .. vim.bo.filetype)
  else
    print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
  end
end, { desc = "Show available linters for current filetype" })
