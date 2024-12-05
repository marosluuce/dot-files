return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<C-n>",
      "<cmd>Neotree toggle<cr>",
      desc = "Toggle Neotree",
    },
    {
      "<C-f>",
      "<cmd>Neotree %:p<cr>",
      desc = "Browse to File",
    },
  },
  config = function() require("neo-tree").setup() end,
}
