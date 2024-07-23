require('mason').setup {
  ui = {
    check_outdated_packages_on_open = false,
  },
}

require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup
    {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,

  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup {
      settings = {
        lua = {
          runtime = {
            -- tell the language server which version of lua you're using
            -- (most likely luajit in the case of neovim)
            version = 'luajit'
          },
          -- make the server aware of neovim runtime files
          workspace = {
            checkthirdparty = false,
            library = {
              vim.env.vimruntime
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. note: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        },
      },
    }
  end,
}
