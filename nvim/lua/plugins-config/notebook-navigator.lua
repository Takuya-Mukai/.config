local nn = require("notebook-navigator")
nn.setup({ activate_hydra_keys = "<leader>h", repl_provider = "molten" })

vim.api.nvim_set_keymap('n', ']h', "<cmd>lua require('notebook-navigator').move_cell('d')<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "[h","<cmd>lua require('notebook-navigator').move_cell('u')<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "<leader>X","<cmd>lua require('notebook-navigator').run_cell()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "<leader>x","<cmd>lua require('notebook-navigator').run_and_move()<CR>", {noremap = true, silent = true})
