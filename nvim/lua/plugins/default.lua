#FIXME gitsigns and which-key is not newest one
return {
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { "h", mode = "c", },
    },
  },
  {
    "catppuccin/nvim", name = 'catppuccin', priority = 1000,
    config = function()
      require 'plugins-config.catppuccin'
    end,
  },
  {
    "HiPhish/Rainbow-delimiters.nvim",
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'plugins-config.rainbow-delimiters'
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    keys = {"/", mod = "n"},
    config = function()
      require 'plugins-config/nvim-hlslens'
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function ()
      require 'plugins-config.nvim-scrollbar'
    end,
    event = "BufEnter",
  },
  {
    'lewis6991/gitsigns.nvim',
    tag = 'v0.7.0',
    config = function ()
      require 'plugins-config.gitsigns'
    end,
    event = "BufEnter",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require 'plugins-config.hlchunk'
    end,
  },
  {
    "keaising/im-select.nvim",
    config = function()
        require("im_select").setup({})
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {},
  --   config = function ()
  --     require 'plugins-config/indent-blankline'
  --   end,
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   event = "BufEnter",
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require 'plugins-config.nvim-treesitter' end,
    build = ":TSUpdate",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require 'plugins-config.lualine'
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', lazy = true
    },
    event = "BufEnter",
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
    lazy = true,
    keys = {'<leader>ff', mode = 'n'},
    config = function() require 'plugins-config.telescope' end,
  },
  {
    'prochri/telescope-all-recent.nvim',
    opts = {},
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    },
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
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   keys = {'<leader><leader>', mode = 'n'},
  --   dependencies = "nvim-telescope/telescope.nvim",
  -- },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require 'plugins-config.oil' end,
  },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   config = function() require 'plugins-config.nvim-tree' end,
  --   dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
  --   -- keys = { { '<leader>ex', mode = 'n' } },
  -- },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
  --   },
  --   lazy = true,
  --   key = { "<space>fb", mode = "n" },
  --   config = function() require 'plugins-config.telescope-file-browser' end,
  -- },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      {
        'neovim/nvim-lspconfig',
        config = function()
          require 'plugins-config.nvim-lspconfig'
        end
      },
    },
    -- lazy = true,
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
    config = function() require 'plugins-config.mason' end,
  },
  {
    'neovim/nvim-lspconfig',
    -- event = "BufEnter",
    config = function() require 'plugins-config.nvim-lspconfig' end,
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    cmd = "InsertEnter",
    config = function() require 'plugins-config.nvim-navic' end,
    dependencies = 'neovim/nvim-lspconfig',
  },
  {
    "SmiteshP/nvim-navbuddy",
    keys = {"<leader>n", mode = "n"},
    config = function() require 'plugins-config.nvim-navbuddy' end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim', 'numToStr/Comment.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  -- {
  --   'numToStr/Comment.nvim',
  --   event = "BufWinEnter",
  --   config = function()
  --     require 'plugins-config.comment'
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() require 'plugins-config.nvim-cmp' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      dependencies =
      {
        {
          'L3MON4D3/LuaSnip',
          version = 'v2.*',
          build = 'make install_jsregexp',
          config = function() require 'plugins-config.luasnip' end,
          dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' }
        },
        {
          'zbirenbaum/copilot-cmp',
          dependencies = 'copilot.lua',
          config = function() require('copilot_cmp').setup() end,
          lazy = true,
          cmd = "CS",
        },
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
      },
    }
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
      require("plugins-config.copilot")
    end,
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    keys = {"<leader>xx", "<leader>xw", "<leader>xd", "<leader>xq", "<leader>xl", mode = "n"},
    config = function() require 'plugins-config.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- spec = {
  --   {import = 'jupyter'},
  -- },
  -- {
  --   "GCBallesteros/jupytext.nvim",
  --   config = true,
  --   lazy = false,
  --   -- ft = 'ipynb'
  -- },
  -- -- {
  -- --   "GCBallesteros/NotebookNavigator.nvim",
  -- --   keys = {
  -- --     { "]h", function() require("notebook-navigator").move_cell "d" end },
  -- --     { "[h", function() require("notebook-navigator").move_cell "u" end },
  -- --     { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
  -- --     { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
  -- --   },
  -- --   dependencies = {
  -- --     "echasnovski/mini.comment",
  -- --     -- {
  -- --     --   "hkupty/iron.nvim", -- repl provider
  -- --     --   config = function()
  -- --     --     require 'plugins-config.iron'
  -- --     --   end,
  -- --     -- },
  -- --     -- "akinsho/toggleterm.nvim", -- alternative repl provider
  -- --     {
  -- --       "benlubas/molten-nvim", -- alternative repl provider
  -- --       dependencies = {
  -- --         {
  -- --           "3rd/image.nvim",
  -- --           opts = {
  -- --             backend = "kitty", -- whatever backend you would like to use
  -- --             max_width = 500,
  -- --             max_height = 500,
  -- --             max_height_window_percentage = math.huge,
  -- --             max_width_window_percentage = math.huge,
  -- --             window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  -- --             window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  -- --           },
  -- --         },
  -- --       },
  -- --       version = "^1.0.0",
  -- --       config = function()
  -- --         require 'plugins-config.molten'
  -- --       end,
  -- --       build = ":UpdateRemoteplugins-config",
  -- --       -- cmd = "MoltenInit",
  -- --       init = function()
  -- --         -- these are examples, not defaults. Please see the readme
  -- --         vim.g.molten_image_provider = "image.nvim"
  -- --         vim.g.molten_output_win_max_height = 500
  -- --         -- vim.g.molten_auto_open_output = true
  -- --         -- vim.g.molten_virt_text_output = true
  -- --         -- vim.g.molten_virt_lines_off_by_1 = true
  -- --       end,
  -- --     },
  -- --     "anuvyklack/hydra.nvim",
  -- --   },
  -- --   event = "VeryLazy",
  -- --   config = function()
  -- --     local nn = require "notebook-navigator"
  -- --     nn.setup({ activate_hydra_keys = "<leader>h", repl_providor = "molten" })
  -- --   end,
  -- -- },
  -- -- {
  -- -- "echasnovski/mini.hipatterns",
  -- -- event = "VeryLazy",
  -- -- dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
  -- -- opts = function()
  -- --   require 'plugins-config.mini-hipatterns'
  -- --   local nn = require "notebook-navigator"
  -- --
  -- --   local opts = { highlighters = { cells = nn.minihipatterns_spec } }
  -- --   return opts
  -- -- end,
  -- -- },
  -- -- {
  -- --   "echasnovski/mini.ai",
  -- --   event = "VeryLazy",
  -- --   dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
  -- --   opts = function()
  -- --     local nn = require "notebook-navigator"
  -- --
  -- --     local opts = { custom_textobjects = { h = nn.miniai_spec } }
  -- --     return opts
  -- --   end,
  -- -- },
  {
    'mfussenegger/nvim-dap',
    config = function() require 'plugins-config.nvim-dap' end,
    lazy = true,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function() require 'plugins-config.dapui' end,
    keys = {'<leader>d', '<F5>', mode = 'n'},
    dependencies = {
      {
        "folke/neodev.nvim", opts = {},
        config = function() require 'plugins-config/neodev' end,
      },
      "nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    'https://github.com/mfussenegger/nvim-dap-python',
    config = function() require 'plugins-config/dap-python' end,
    ft = 'python',
    dependencies = 'mfussenegger/nvim-dap',
  },
  {
    'folke/which-key.nvim',
    tag = 'v1.4.0',
    config = function() require 'plugins-config/which-key' end,
    opts = {},
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
    event = "VimEnter",
    config = function() require 'plugins-config.fidget' end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {},
    config = function() require 'plugins-config.nvim-notify' end,
    event = "BufEnter",
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      handlers = {}
    },
  },
  {
    'echasnovski/mini.nvim',
      config = function() require 'plugins-config.mini' end,
  },
  {
    'akinsho/toggleterm.nvim', version = "*",
    keys = {"<leader>g", "<leader>tt"},
    config = function() require 'plugins-config.toggleterm' end,
  }
}
