--
-- These are general keybindings.
-- Plugin-specific bindings are set in their respective setup files.
--

-- Map Tab to indent in V mode
vim.keymap.set('v', '<Tab>', '>', { remap = false })

-- Map Shift-Tab to dedent
vim.keymap.set('n', '<S-Tab>', '<<', { remap = false })
vim.keymap.set('i', '<S-Tab>', '<C-d>', { remap = false })
vim.keymap.set('v', '<S-Tab>', '<', { remap = false })
