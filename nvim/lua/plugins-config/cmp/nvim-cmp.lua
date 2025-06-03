local cmp = require 'cmp'
local luasnip = require 'luasnip'

local map = cmp.mapping

cmp.setup {
  window = {
    documentation = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winblend = 20,
    },
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
      winblend = 20,
    }
  },

  formatting = {
    format = require('lspkind').cmp_format {
      mode = 'symbol_text',
      preset = 'codicons',
      symbol_map = { Copilot = '' },
    },
  },

  mapping = map.preset.insert {
    ['<C-d>'] = map.scroll_docs(-4),
    ['<C-f>'] = map.scroll_docs(4),
    ['<C-Space>'] = map.complete(),
    ['<C-e>'] = map.abort(),
    ['<CR>'] = map.confirm { select = false },

  },
  sources = cmp.config.sources{
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'copilot' },
    { name = 'buffer' },
    { name = 'vimtex' },
    { name = 'path' },
    {
      name = 'latex_symbols',
      option = {
        strategy = 0,
      }
    }
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end, },
}
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})
