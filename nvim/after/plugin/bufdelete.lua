vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', {
    desc = "Buffer delete",
    noremap = true,
    silent = true
})

vim.api.nvim_set_keymap('n', '<leader>bw', ':Bwipeout<CR>', {
    desc = "Buffer wipeout",
    noremap = true,
    silent = true
})
