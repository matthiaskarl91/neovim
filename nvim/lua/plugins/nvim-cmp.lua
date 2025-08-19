vim.pack.add({"https://github.com/hrsh7th/nvim-cmp"})

require("cmp").setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end
  }
})
