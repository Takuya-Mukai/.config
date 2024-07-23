require('telescope').setup {
  lazy = true,
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
    winblend = 20,
  },
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/muta/.config",
        ["data"]    = "/home/muta/.local/share",
        ["project"] = "/home/muta/projects",
        ["wiki"]    = "/home/muta/wiki"
      }
    }
  },
}
require('telescope').load_extension('fzf')
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
-- local themes = require 'telescope.themes'
--
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files)
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep)
-- vim.keymap.set('n', '<leader>fb', builtin.buffers)
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags(require("telescope").getivy()))
-- vim.keymap.set('n', '<C-l>', builtin.diagnostics)
-- vim.keymap.set('n', '<leader>fr', builtin.lsp_references)
-- vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
-- vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
-- vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<CR>')
-- vim.keymap.set('n', '<leader>fbi', builtin.builtin)
-- vim.keymap.set("n", "<leader><leader>f", "<Cmd>Telescope frecency<CR>")
-- vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>")
-- vim.keymap.set('n', '<leader>h', function()
--   builtin.help_tags(themes.get_ivy())
-- end)
