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
local wk = require("which-key")
local themes = require("telescope.themes")
local tel_b = require("telescope.builtin")
wk.add({
    {"<leader>", group = "plugins"},
    {"<leader>f", group = "telescope"},
    {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"},
    {"<leader>fg","<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
    {"<leader>fb","<cmd>Telescope buffurs<cr>", desc = "Buffers"},
    {"<leader>fh", function() tel_b.help_tags(themes.getivy()) end, desc = "Help Tags"},
    {"<leader>fd", function() tel_b.diagnostics(themes.get_ivy()) end, desc = "Diagnostics"},
    {"<leader>fr", function() tel_b.lsp_references(themes.get_ivy()) end, desc = "LSP References"},
    {"<leader>fs", function() tel_b.lsp_document_symbols(themes.get_ivy()) end, desc = "LSP Document Symbols"},
    {"<leader>fc", "<cmd>Telescope commands<cr>", desc = "All Commands"},
    {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"},
    {"<leader>fi", "<cmd>Telescope builtin<cr>", desc = "Builtins"},

    {"<leader><leader>", group = "Telescope frecency"},
    {"<leader><leader>f", "<cmd>Telescope frecency<CR>", desc = "Frecency"},
    {"<leader><leader>w", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Frecency CWD "},
    {"<leader>n", group = "Navnuddy"},
    {"<leader>nb", "<cmd>lua require('nvim-navbuddy').open()<cr>", desc = "Navbuddy"},
})
