local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Add tree sitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Signs for added, removed, and changed lines
Plug('lewis6991/gitsigns.nvim')

-- LSP config
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

-- Dependancies for telescope
Plug('nvim-lua/plenary.nvim') -- required
Plug('BurntSushi/ripgrep') -- required for grep

-- Fuzzy finding files + file grep
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x'})

-- Fancy status line
Plug('nvim-lualine/lualine.nvim')

-- Fancy file icons
Plug('nvim-tree/nvim-web-devicons')

-- Adds small bg color on hex codes
Plug('norcalli/nvim-colorizer.lua')

vim.call('plug#end')


require('nvim_options')
require('nvim_theme')

-- Importing config files
require('plugins.colorizer')
require('plugins.git_signs')
require('plugins.lsp_config')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.tree_sitter')
