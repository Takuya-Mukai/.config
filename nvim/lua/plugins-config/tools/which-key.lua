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
    {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"},
    {"<leader>fi", "<cmd>Telescope builtin<cr>", desc = "Builtins"},

    {"<leader><leader>", group = "Telescope frecency"},
    {"<leader><leader>f", "<cmd>Telescope frecency<CR>", desc = "Frecency"},
    {"<leader><leader>w", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Frecency CWD "},
    {"<leader>n", group = "Navnuddy"},
    {"<leader>nb", "<cmd>lua require('nvim-navbuddy').open()<cr>", desc = "Navbuddy"},
})
