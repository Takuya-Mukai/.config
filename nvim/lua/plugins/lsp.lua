return {
  {
    'folke/trouble.nvim',
    lazy = true,
    keys = {"<leader>x", mode = "n"},
    config = function() require 'plugins-config.lsp.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      -- 'hrsh7th/cmp-nvim-lsp',
      -- 'williamboman/mason-lspconfig.nvim',
      -- {
      --   'neovim/nvim-lspconfig',
      --   config = function()
      --     require 'plugins-config.lsp.nvim-lspconfig'
      --   end
      -- },
    },
    lazy = true,
    -- cmd = {
    --   "Mason",
    --   "MasonInstall",
    --   "MasonUninstall",
    --   "MasonUninstallAll",
    --   "MasonLog",
    --   "MasonUpdate",
    -- },
    config = function() require 'plugins-config.lsp.mason' end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins-config.lsp.nvim-lspconfig' end,
    dependencies = {
      -- 'williamboman/mason.nvim',
      'williamoman/mason-lspconfig.nvim',
    },
    lazy = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      -- 'neovim/nvim-lspconfig',
    },
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    lazy = true,
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
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = 'williamboman/mason.nvim',
    config = function() require 'plugins-config.lsp.mason-tool-installer' end,
    -- lazy=true,
  }
}
