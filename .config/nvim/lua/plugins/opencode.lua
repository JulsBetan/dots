return {
  'NickvanDyke/opencode.nvim',
  event = 'VeryLazy',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'folke/snacks.nvim',
      opts = { input = { enabled = true } },
    },
    {
      -- ampliar tipos para previsualizar la salida de OpenCode junto a markdown
      'MeanderingProgrammer/render-markdown.nvim',
      opts = function(_, opts)
        opts = opts or {}
        opts.file_types = opts.file_types or { 'markdown' }
        if not vim.tbl_contains(opts.file_types, 'opencode_output') then
          table.insert(opts.file_types, 'opencode_output')
        end
        return opts
      end,
    },
  },
  keys = {
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'OpenCode: toggle panel' },
    { '<leader>oa', function() require('opencode').ask('@cursor: ') end, desc = 'OpenCode: preguntar sobre el cursor' },
    { '<leader>oq', function() require('opencode').ask('Pregunta: ') end, desc = 'OpenCode: pregunta libre' },
    { '<leader>oi', function() require('opencode').focus_input() end, desc = 'OpenCode: enfocar input' },
  },
  config = function()
    -- Config mínima: OpenCode leerá las credenciales del CLI/entorno.
    -- Asegúrate de haber hecho `opencode auth login` o exportado OPENAI_API_KEY/ANTHROPIC_API_KEY, etc.
    vim.g.opencode_opts = vim.g.opencode_opts or {}
    -- Opcional: preferencia de proveedor/modelo por defecto
    -- vim.g.opencode_opts.provider = 'openai'
    -- vim.g.opencode_opts.model = 'gpt-4o'
  end,
}
