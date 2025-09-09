((call_expression
  function: (identifier) @func
  arguments: (template_string) @injection.content)
 (#any-of? @func "gql" "graphql")
 (#set! injection.language "graphql")
 (#set! injection.combined))
