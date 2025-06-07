return{
  {
    'folke/which-key.nvim',
    -- tag = 'v1.4.0',
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
    cmd = 'Telescope',
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
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    keys = { { '<leader>ex', mode = 'n' } },
  },
  {
    "mikavilpas/yazi.nvim",
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
    event = "BufReadPost",
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('plugins-config.tools.nvim-ufo')
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = '<leader>c',
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    config = function()
      require("plugins-config.tools.copilotchat")
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "gpanders/nvim-parinfer",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("hardtime").setup({

      })
    end,
  },
  -- {
  --   'VonHeikemen/fine-cmdline.nvim',
  --   dependencies = {
  --     {'MunifTanjim/nui.nvim'},
  --     {'hrsh7th/nvim-cmp'},
  --     {'hrsh7th/cmp-cmdline'},
  --   },
  --   config = function()
  --     vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
  --     require('fine-cmdline').setup({
  --       -- ここに fine-cmdline の設定を記述
  --       -- 例えば、デフォルトの表示方法の変更など
  --       -- cmdline_popup = {
  --       --   enabled = true,
  --       --   position = 'center', -- または 'center'
  --       --   size = { width = 0.8, height = 0.8 },
  --       -- },
  --       hooks = {
  --         -- 補完ポップアップが開いた時に、fine-cmdline の補完機能を有効にする
  --         -- nvim-cmp との連携がスムーズに行われるためのフック
  --         on_cmdline_enter = function()
  --           vim.api.nvim_set_option_value("cmdheight", 0, { scope = "global" })
  --         end,
  --         on_cmdline_leave = function()
  --           vim.api.nvim_set_option_value("cmdheight", 1, { scope = "global" })
  --         end,
  --       },
  --     })
  --   end,
  -- },
}
