return {
  -- Command and arguments to start the server.
  cmd = { 'gopls' },

  -- Filetypes to automatically attach to.
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl'  },

  root_markers = {  'go.mod'  },

  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
