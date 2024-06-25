local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Add tree sitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Signs for added, removed, and changed lines
Plug('lewis6991/gitsigns.nvim')

vim.call('plug#end')


-- Tree sitter config
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "lua", "vim", "vimdoc", "query", "python" },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}


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
