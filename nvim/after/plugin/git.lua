require "neogit".setup {}
require "gitsigns".setup {}

vim.keymap.set('n', '<leader>git', ':Neogit<CR>', { desc = "Open Neogit" })
