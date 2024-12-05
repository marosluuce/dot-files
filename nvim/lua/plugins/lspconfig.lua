return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.tsserver.setup({
        cmd = { "typescript-language-server", "--stdio", },
      })
      lspconfig.rust_analyzer.setup({})
    end,
  },
  'williamboman/mason.nvim',
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          default_setup,
        }
      })
    end
  },
}
