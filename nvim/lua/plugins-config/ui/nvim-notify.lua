local notify = require('notify')

notify.setup()

vim.notify = notify

local telescope = require'telescope'
telescope.load_extension('notify')

local wk = require("which-key")
wk.add({
  {"<leader>fn", function() telescope.extensions.notify.notify() end, desc = "Notify", icon = "󰟶 "}
})
