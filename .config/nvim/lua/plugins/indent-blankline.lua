return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "┊" },  -- Usa "┆" o "┊" si prefieres líneas más sutiles
    scope = { show_start = true, show_end = true }, -- Resalta el bloque de código activo
  }
}
