return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      "lua",
      "ruby",
      "rust",
      "typescript",
    },
    highlight = {
      enable = true,
    },
  },
}
