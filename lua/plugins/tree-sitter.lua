
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    install_dir = vim.fn.stdpath('data') .. '/site'
  },
  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.install({ 'html', 'css', 'javascript', 'typescript', 'tsx', 'python' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'css', 'typescriptreact', 'javascript', 'typescript', 'python' },
      callback = function() vim.treesitter.start() end,
    })

  end
}

