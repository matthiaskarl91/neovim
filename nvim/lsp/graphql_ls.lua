return {
  cmd = { 'graphql-lsp', 'server', '--method=stream' },
  filetypes = { 'graphql', 'gql', 'graphqls', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = {
    '.graphqlrc', '.graphqlrc.json', '.graphqlrc.yaml', '.graphqlrc.yml',
    'graphql.config.js', 'graphql.config.ts', 'graphql.config.json', 'graphql.config.yml',
    'package.json',
  },
}
