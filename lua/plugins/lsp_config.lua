require('mason').setup {}

require('mason-lspconfig').setup {
    ensure_installed = { "lua_ls", "pyright", "tsserver", "html", "cssls"}
}

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
        -- Opt out of semantic token highlighting. Conflicted with theme
        client.server_capabilities.semanticTokensProvider = nil
    end,
}

lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
