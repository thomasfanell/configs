require("neo-tree").setup {
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        }
    }
}

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
