vim.pack.add({ "https://github.com/MonsieurTib/package-ui.nvim" })

require("package-ui").setup()

vim.keymap.set("n", "<leader>pu", "<cmd>PackageUI<cr>", { desc = "Open Package UI" })
