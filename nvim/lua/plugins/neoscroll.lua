vim.pack.add({ "https://github.com/karb94/neoscroll.nvim" })

require("neoscroll").setup({
  hide_cursor = true,
  stop_eof = true,
  easing_function = "sine",
  cursor_scrolls_alone = true,
})
