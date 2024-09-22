--
-- Colors
--
vim.cmd.colorscheme "rose-pine"
vim.opt.termguicolors = true

--
-- Line numbers
--
vim.opt.number = true
vim.opt.relativenumber = true

--
-- Indentation
--
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--
-- Wrapping
--
vim.opt.wrap = false

--
-- Undo/backup
--
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

--
-- Search
--
vim.opt.hlsearch = false
vim.opt.incsearch = true

--
-- Misc.
--
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.fillchars = { eob = ' ' }

vim.opt.updatetime = 50
