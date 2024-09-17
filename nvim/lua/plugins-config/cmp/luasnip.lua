require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_vscode').lazy_load {
  paths = {
    vim.fn.stdpath('data') .. '~/.local/share/nvim/lazy/friendly-snippets',
    './snippets',
  },
}
