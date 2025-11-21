local tsdk = (vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", "astro.config.mjs", "astro.config.ts", ".git" }) or vim.loop.cwd())
    .. "/node_modules/typescript/lib"
return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    typescript = {
      tsdk = tsdk
    }
  },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" }
}
