return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "astro", "html", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  settings = {
    tailwindCSS = {
      -- === tailwindCSS.includeLanguages ===
      -- VSCode:
      -- "tailwindCSS.includeLanguages": { "plaintext": "html" }
      includeLanguages = {
        -- plaintext = "html",
      },

      -- === tailwindCSS.files.exclude ===
      files = {
        exclude = {
          "**/.git/**",
          "**/node_modules/**",
          "**/.hg/**",
          "**/.svn/**",
        },
      },

      -- === tailwindCSS.classAttributes ===
      -- Default in the extension: class, className, ngClass, class:list :contentReference[oaicite:2]{index=2}
      classAttributes = { "class", "className", "ngClass", "class:list" },

      -- === tailwindCSS.classFunctions ===
      -- Same semantics as in VSCode settings
      -- "tailwindCSS.classFunctions": ["tw", "clsx", "tw\\.[a-z-]+"]
      classFunctions = { "tw", "clsx", "tw\\.[a-z-]+" },

      -- === tailwindCSS.emmetCompletions ===
      emmetCompletions = false,

      -- === tailwindCSS.colorDecorators ===
      colorDecorators = true,

      -- === tailwindCSS.showPixelEquivalents / rootFontSize ===
      showPixelEquivalents = true,
      rootFontSize = 16,

      -- === tailwindCSS.hovers / suggestions / codeActions / validate ===
      hovers = true,
      suggestions = true,
      codeActions = true,
      validate = true,

      -- === tailwindCSS.lint.* ===
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidTailwindDirective = "error",
        invalidConfigPath = "error",
        recommendedVariantOrder = "warning",
        usedBlocklistedClass = "warning",
        suggestCanonicalClasses = "warning",
      },

      -- === tailwindCSS.experimental.configFile ===
      -- You can hard-point the server to your Tailwind config / CSS entrypoint
      -- just like in VSCode:
      -- For v4 (CSS entrypoints):
      -- experimental = {
      --   configFile = "src/styles/app.css",
      -- },
      -- For v3 & below (config files):
      -- experimental = {
      --   configFile = ".config/tailwind.config.js",
      -- },
    },
  },
  root_markers = { "package.json", "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", "tsconfig.json", "jsconfig.json", ".git" }
}
