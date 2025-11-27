-- lua/plugins/treesitter-context.lua (por ejemplo)
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 2,        -- cuántas líneas “pegadas” arriba
      trim_scope = "outer", -- recorta si es largo
      mode = "cursor",      -- actualiza por posición del cursor
      separator = nil,      -- o "─" para una línea separadora
    })
  end,
}
