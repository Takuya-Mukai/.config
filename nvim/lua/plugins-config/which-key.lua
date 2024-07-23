local wk = require("which-key")
local themes = require("telescope.themes")
local tel_b = require("telescope.builtin")
wk.register({
  ["<leader>"] = {
    name = 'plugins',
    f = {
      name = "telescope",
      f = {"<cmd>Telescope find_files<cr>", "Find File"},
      g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
      b = {"<cmd>Telescope buffurs<cr>", "Buffers"},
      -- h = {"<cmd>Telescope help_tags(themes.get_ivy())<cr>", "Help Tags"},
      h = {function() tel_b.help_tags(themes.get_ivy()) end, "Help Tags"},
      d = {function() tel_b.diagnostics(themes.get_ivy()) end, "Diagnostics"},
      r = {function() tel_b.lsp_references(themes.get_ivy()) end, "LSP References"},
      s = {function() tel_b.lsp_document_symbols(themes.get_ivy()) end, "LSP Document Symbols"},
      k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
      i = {"<cmd>Telescope builtin<cr>", "Builtins"},
    },

    ["<leader>"] = {
      name = "Telescope Frecency",
      f = {"<cmd>Telescope frecency<CR>", "Frecency"},
      w = {"<cmd>Telescope frecency workspace=CWD<CR>", "Frecency CWD "},
    },
    n = {
      name = "Navbuddy",
      b = {"<cmd>lua require('nvim-navbuddy').open()<cr>", "Navbuddy"}
    }
  }
})
