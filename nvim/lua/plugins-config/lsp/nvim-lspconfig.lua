-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    local wk = require("which-key")
    wk.add({
      {'g', group="LSP info"},
      {'gD', vim.lsp.buf.declaration, desc="Declaration", opts},
      {'gd', vim.lsp.buf.definition, desc="Definition", opts},
      {'gi', vim.lsp.buf.implementation, desc="Implementation", opts},
      {'gr', vim.lsp.buf.references, desc="References", opts},
      {'K', vim.lsp.buf.hover, desc="Buffer hover", opts},
      {'<C-k>', vim.lsp.buf.signature_help, opts},
      {'<space>', group="LSP tools"},
      {'<space>wa', vim.lsp.buf.add_workspace_folder, desc="Add workspace folder", opts},
      {'<space>wr', vim.lsp.buf.remove_workspace_folder, desc="Remove workspace folder", opts},
      {'<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, desc="List workspace folder", opts},
      {'<space>D', vim.lsp.buf.type_definition, desc="Type-definition",opts},
      {'<space>rn', vim.lsp.buf.rename, desc="Rename", opts},
      {'<space>ca', vim.lsp.buf.code_action, desc="Code action", opts},
      {'<space>f', function()
        vim.lsp.buf.format { async = true }
      end, desc="Format", opts},
    })
  end,
})

require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- すべてのLSP共通設定
vim.lsp.set_log_level("info")

-- lua_ls に特化した設定
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
