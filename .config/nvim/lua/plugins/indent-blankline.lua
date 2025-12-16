-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   main = "ibl",
--   opts = {
--     indent = { char = "┊" },  -- Usa "┆" o "┊" si prefieres líneas más sutiles
--     scope = { show_start = true, show_end = true }, -- Resalta el bloque de código activo
--   }
-- }
--
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "┊",
        },
        scope = {
            enabled = true,     -- muy importante
            show_start = true,
            show_end = true,
            -- sin 'highlight' personalizado aquí para evitar el bug
        },
    },
    config = function(_, opts)
        local ibl = require("ibl")
        local hooks = require("ibl.hooks")

        -- Definimos el grupo de highlight una sola vez
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IblScope", { fg = "#cba6f7" }) -- azul tipo Catppuccin
        end)

        -- Le decimos al scope que use ese grupo
        opts.scope.highlight = "IblScope"

        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )

        ibl.setup(opts)
    end,
}
