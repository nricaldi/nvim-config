
vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

-- Enable list mode to show invisible characters
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '» ', trail = '•', nbsp = ' ' }

-- Enforce consistent tab width
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2

vim.opt.winborder = 'rounded'

-- vim motions to swap between nvim panes
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
