
return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'lua_ls',
      'ts_ls',
      'pyright',
      'cssls',
    }
  },
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
          }
        }
      }
    },
    'neovim/nvim-lspconfig',
  },
}
