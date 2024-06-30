
-- Tree sitter config
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "html", "css", "javascript", "vue" },

    -- Automatically install missing parsers when entering buffer
    -- auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
