-- その他の設定
vim.api.nvim_set_option_value("termguicolors", true, { scope = "global" })
vim.wo.number = true
vim.cmd("syntax enable")
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.showmode = false
vim.wo.cursorline = false
vim.wo.relativenumber = true
vim.wo.scrolloff = 5
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.bo.softtabstop = 2
vim.opt.laststatus = 3
vim.opt.conceallevel = 1
vim.o.helplang = "ja,en"
vim.api.nvim_set_option_value("signcolumn", "yes:1", {})
vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})
vim.o.clipboard = "unnamedplus"

-- local function paste()
--   return {
--     vim.fn.split(vim.fn.getreg(""), "\n"),
--     vim.fn.getregtype(""),
--   }
-- end
--
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = paste,
--     ["*"] = paste,
--   },
-- }
vim.api.nvim_set_option_value("wrap", false, {})
vim.g.maplocalleader = ' '
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
--   pattern = '*',
--   callback = function()
-- 10.3.1 節で書いたコードをここに移動する
vim.api.nvim_set_option_value("tabstop", 2, {})
vim.api.nvim_set_option_value("shiftwidth", 2, {})
vim.api.nvim_set_option_value("expandtab", true, {})
--   end,
-- })

vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
-- キーマッピング
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })
-- コマンドモードで "Vim" と入力すると、init.lua を開く
-- Don't auto-insert line break when selecting completion
vim.cmd("autocmd TermOpen * setlocal nonumber")
vim.cmd("autocmd TermOpen * setlocal norelativenumber")

local fcitx5state = vim.fn.system("fcitx5-remote"):sub(1, 1)

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    fcitx5state = vim.fn.system("fcitx5-remote"):sub(1, 1)
    vim.fn.system("fcitx5-remote -c")
  end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if fcitx5state == "2" then
      vim.fn.system("fcitx5-remote -o")
    end
  end
})
