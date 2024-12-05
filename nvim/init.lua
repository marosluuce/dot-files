vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

require("config.lazy")

vim.wo.number = true
vim.o.background = "light"
vim.opt.termguicolors = true

vim.cmd[[colorscheme tokyonight-day]]

vim.opt.swapfile = false

