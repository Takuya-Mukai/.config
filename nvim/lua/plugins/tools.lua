return{
  {
    'folke/which-key.nvim',
    -- tag = 'v1.4.0',
    config = function() require 'plugins-config.tools.which-key' end,
    opts = {},
    lazy = true,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
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
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
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
