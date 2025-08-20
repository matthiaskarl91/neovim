vim.pack.add({
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/rafamadriz/friendly-snippets',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('v1.6.0') }
})

require("blink.cmp").setup({
  snippets = { preset = "luasnip" },
  signature = { enabled = true },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "normal",
  },
  sources = {
    -- per_filetype = {
    --     codecompanion = { "codecompanion" },
    -- },
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      cmdline = {
        min_keyword_length = 2,
      },
    },
  },
  keymap = {
    ["<C-f>"] = {},
  },
  --cmdline = {
  -- enabled = false,
  --completion = { menu = { auto_show = true } },
  --keymap = {
  --  ["<CR>"] = { "accept_and_enter", "fallback" },
  --},
  -- },
  completion = {
    ghost_text = {
      enabled = true,
    },
    menu = {
      border = nil,
      scrolloff = 1,
      scrollbar = false,
      draw = {
        columns = {
          { "kind_icon" },
          { "label",      "label_description", gap = 1 },
          { "kind" },
          { "source_name" },
        },
      },
    },
    documentation = {
      window = {
        border = nil,
        scrollbar = false,
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
      },
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
})

require('luasnip.loaders.from_vscode').lazy_load()
