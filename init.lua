local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Add tree sitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

vim.call('plug#end')


-- Tree sitter config
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
    
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
	enable = true,

	additional_vim_regex_highlighting = false,
    },
}

-- Base config
vim.o.number = true
vim.o.syntax = "on"
vim.o.shiftwidth = 4

vim.opt.termguicolors = true

require('custom_theme')

