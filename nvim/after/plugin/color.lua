require("catppuccin").setup {
    flavour = "mocha",
    no_italic = true,
}

--[[
require("rose-pine").setup {
    variant = "main",
    disable_italics = true,
}
--]]

vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true
