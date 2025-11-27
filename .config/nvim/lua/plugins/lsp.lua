return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/lazydev.nvim",
    },
    config = function()
        require("lazydev").setup({})

        -- Función on_attach para reutilizar los keymaps
        local on_attach = function(client, bufnr)
            local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end

            local opts = { noremap = true, silent = true }

            -- Mapeos para LSP
            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)           -- Ir a la definición
            buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)          -- Ir a la declaración
            buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)           -- Ir a referencias
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)                 -- Mostrar información sobre el símbolo bajo el cursor
            buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)    -- Mostrar ayuda de firma de función
            buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)       -- Renombrar símbolo
            buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)  -- Ejecutar acción de código (como arreglar errores)
            buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)        -- Formatear el documento
            buf_set_keymap('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts) -- Mostrar errores del diagnóstico bajo el cursor
            buf_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)         -- Ir al diagnóstico anterior
            buf_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)         -- Ir al diagnóstico siguiente
            buf_set_keymap('n', '<leader>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts) -- Añadir diagnósticos a la lista de localización

            -- Configuración adicional para mejorar la experiencia
            if client.server_capabilities.documentFormattingProvider then
                buf_set_keymap("n", "<leader>fmt", "<Cmd>lua vim.lsp.buf.format()<CR>", opts) -- Atajo para formatear el archivo
            end
        end

    ------------------------------------------------------------------
  -- 1) Definiciones con la API nueva
  ------------------------------------------------------------------

  -- Lua (lua_ls)
  vim.lsp.config["lua_ls"] = {
    on_attach = on_attach,
    settings = {
      Lua = {
        telemetry = { enable = false },
        workspace = { checkThirdParty = false },
        diagnostics = { globals = { "vim" } },
      },
    },
  }

  -- Python (pylsp)
  vim.lsp.config["pylsp"] = {
    on_attach = on_attach,
    --cmd = { vim.fn.getcwd() .. "/venv/bin/pylsp" }, -- mantengo tu venv local
    cmd = (function()
        local local_cmd = vim.fn.getcwd() .. "/venv/bin/pylsp"
        if vim.fn.executable(local_cmd) == 1 then
          return { local_cmd }          -- usa el venv del proyecto
        end
        local mason_cmd = vim.fn.stdpath("data") .. "/mason/bin/pylsp"
        if vim.fn.executable(mason_cmd) == 1 then
          return { mason_cmd }          -- fallback a Mason
        end
        return { "pylsp" }              -- último recurso (PATH del sistema)
    end)(),
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = { maxLineLength = 100 },
          pylint = { enabled = true },
        },
      },
    },
  }

  -- YAML (yamlls)
  vim.lsp.config["yamlls"] = {
    on_attach = on_attach,
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  }

  -- TypeScript / JavaScript (ts_ls)
  vim.lsp.config["ts_ls"] = {
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    settings = {
      typescript  = { format = { enable = true } },
      javascript  = { format = { enable = true } },
    },
  }

  -- Vue (volar)
  vim.lsp.config["volar"] = {
    on_attach = on_attach,
    filetypes = { "vue" },
    settings = {
      volar = {
        typescript = {
          tsdk = "/usr/local/lib/node_modules/typescript/lib", -- ajusta si hace falta
        },
      },
    },
  }

  ------------------------------------------------------------------
  -- 2) Autocmds para iniciar cada server por filetype
  ------------------------------------------------------------------

  -- Lua
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    callback = function() vim.lsp.start(vim.lsp.config["lua_ls"]) end,
  })

  -- Python
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function() vim.lsp.start(vim.lsp.config["pylsp"]) end,
  })

  -- YAML
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yml" },
    callback = function() vim.lsp.start(vim.lsp.config["yamlls"]) end,
  })

  -- TS / JS
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function() vim.lsp.start(vim.lsp.config["ts_ls"]) end,
  })

  -- Vue
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "vue" },
    callback = function() vim.lsp.start(vim.lsp.config["volar"]) end,
  })
end,
}
