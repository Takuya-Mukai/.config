return{
    {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() require 'plugins-config.cmp.nvim-cmp' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      dependencies =
      {
        {
          'L3MON4D3/LuaSnip',
          version = 'v2.*',
          build = 'make install_jsregexp',
          config = function() require 'plugins-config.cmp.luasnip' end,
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
        'onsails/lspkind.nvim',
        "kdheepak/cmp-latex-symbols",
      },
    }
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
      require("plugins-config.cmp.copilot")
    end,
  },
}
