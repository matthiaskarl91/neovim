vim.pack.add({ 'https://github.com/echasnovski/mini.icons', 'https://github.com/ibhagwan/fzf-lua' })

vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files() end)                               -- Find Files in project directory
vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep() end)                           -- Find by grepping in project directory
vim.keymap.set('n', '<leader>fc', function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end) -- Find in neovim configuration
vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').helptags() end)                            -- [F]ind [H]elp
vim.keymap.set('n', '<leader>fk', function() require('fzf-lua').keymaps() end)                             -- [F]ind [K]eymaps
vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').builtin() end)                             -- [F]ind [B]uiltin FZF
vim.keymap.set('n', '<leader>fw', function() require('fzf-lua').grep_cword() end)                          -- [F]ind current [W]ord
vim.keymap.set('n', '<leader>fW', function() require('fzf-lua').grep_cWORD() end)                          -- [F]ind current [W]ORD
vim.keymap.set('n', '<leader>fd', function() require('fzf-lua').diagnostics_document() end)                -- [F]ind [D]iagnostics
vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').resume() end)                              -- [F]ind [R]esume
vim.keymap.set('n', '<leader>fo', function() require('fzf-lua').oldfiles() end)                            -- [F]ind [O]ld Files
vim.keymap.set('n', '<leader><leader>', function() require('fzf-lua').buffers() end)                       -- [,] Find existing buffers
vim.keymap.set('n', '<leader>/', function() require('fzf-lua').lgrep_curbuf() end)                         -- [/] Live grep the current buffer
