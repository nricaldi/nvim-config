local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Add tree sitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Signs for added, removed, and changed lines
Plug('lewis6991/gitsigns.nvim')

-- Dependancies for telescope
Plug('nvim-lua/plenary.nvim') -- required
Plug('BurntSushi/ripgrep') -- required for grep

-- Fuzzy finding files + file grep
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x'})

vim.call('plug#end')


-- Base config
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append("space:.")
vim.opt.listchars:append("tab:->")
vim.opt.signcolumn = "yes"

require('custom_theme')
require('git_signs')
require('tree_sitter')
