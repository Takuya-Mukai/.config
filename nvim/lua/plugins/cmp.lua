return{
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function() require 'plugins-config.cmp.nvim-cmp' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      event = { "InsertEnter", "CmdlineEnter"},
      dependencies = {
        {
          'L3MON4D3/LuaSnip',
          build = 'make install_jsregexp',
          config = function() require 'plugins-config.cmp.luasnip' end,
          dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
          event = "InsertEnter",
        },
        {
          'zbirenbaum/copilot-cmp',
          dependencies = 'copilot.lua',
          config = function() require('copilot_cmp').setup() end,
          cmd = "CS",
          event = "InsertEnter",
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
    event = "InsertEnter",
    config = function()
      require("plugins-config.cmp.copilot")
    end,
  },
}
