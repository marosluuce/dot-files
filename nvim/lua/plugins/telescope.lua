return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make'  }
  },
  keys = {
    {
      '<C-p>',
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    {
      '<leader>t',
      function() require("telescope.builtin").live_grep() end,
      desc = "Find in files",
    },
    {
      '<leader>T',
      function() require("telescope.builtin").grep_string() end,
      desc = "Find in files under cursor",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      preview = {
        filesize_limit = 0.1,
      },
      mappings = {
        i = {
          ["<esc>"] = "close",
        },
      },
    },
  },
  init = function()
    require('telescope').load_extension('fzf')
  end
}
