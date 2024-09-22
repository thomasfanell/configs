require "neo-tree".setup {
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        }
    }
}

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { desc = "Open Neotree to the left" })
vim.keymap.set('n', '<leader>fb', ':Neotree buffers reveal float<CR>', { desc = "Show buffers" })
