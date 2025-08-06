vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require('gitsigns').setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,
  numhl = true,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 100,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%d.%m.%Y> - <summary>",
  sign_priority = 6,
  status_formatter = nil,
  update_debounce = 200,
  max_file_length = 40000,
  preview_config = {
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local map = vim.keymap.set
    map("n", "<leader>H", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
    map("n", "]]", gitsigns.next_hunk, { buffer = bufnr, desc = "Next git hunk" })
    map("n", "[[", gitsigns.prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
  end
})
