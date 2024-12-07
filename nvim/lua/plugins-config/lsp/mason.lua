require('mason').setup {
  ui = {
    check_outdated_packages_on_open = false,
  },
}

local lsp = require"lspconfig"

require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup
    {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,

  ['lua_ls'] = function()
    lsp.lua_ls.setup {
      on_init = function(client)
        if not client.workspace_folders then
          return
        end

        local path = client.workspace_folders[1].name

        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        })
      end,
      settings = {
        Lua = {},
      },
    }
  end,
}

-- command to start lua_ls if not started
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = "*.lua",
  callback = function()
    local lua_ls_active = false
    local buf_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

    for _, client in pairs(buf_clients) do
      if client.name == "lua_ls" then
        lua_ls_active = true
        break
      end
    end

    if not lua_ls_active then
      vim.cmd("LspStart lua_ls")
    end
  end,
})

