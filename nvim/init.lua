vim.loader.enable()
require('config.config')
require('config.lazy')
if vim.g.neovide then
  require('config.neovide')
end

