return{
  {
    "catppuccin/nvim", name = 'catppuccin', priority = 1000,
    config = function() require 'plugins-config.color.catppuccin' end,
  },
  {
    "HiPhish/Rainbow-delimiters.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'catppuccin/nvim',
    },
    config = function() require 'plugins-config.color.rainbow-delimiters' end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require 'plugins-config.color.nvim-treesitter' end,
    build = ":TSUpdate",
    dependencies = {'catppuccin/nvim'},
  },
}
