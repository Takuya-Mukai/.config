return{
  {
    'folke/which-key.nvim',
    -- tag = 'v1.4.0',
    config = function() require 'plugins-config.tools.which-key' end,
    opts = {},
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- or... tag = '0.1.1'
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
      },
    },
    keys = {
      {'<leader>f', '<leader>ex', mode = 'n'},
    },
    config = function() require 'plugins-config.tools.telescope' end,
  },
  {
    'prochri/telescope-all-recent.nvim',
    opts = {},
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    },
    keys = {'<leader>f', mode = 'n'},
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {'<leader>f', mode = 'n'},
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function() require 'plugins-config.tools.nvim-tree' end,
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
    keys = { { '<leader>ex', mode = 'n' } },
  },
  {
    'echasnovski/mini.nvim',
      config = function() require 'plugins-config.tools.mini' end,
  },
  {
    'akinsho/toggleterm.nvim', version = "*",
    keys = {"<leader>g", "<leader>tt"},
    config = function() require 'plugins-config.tools.toggleterm' end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('plugins-config.tools.nvim-ufo')
    end,
  },
}
