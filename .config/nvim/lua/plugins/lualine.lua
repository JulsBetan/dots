return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', "catppuccin/nvim" },
    opts = {
        options = {
            theme = "catppuccin", -- usa automáticamente tu flavor actual (mocha, latte, etc.)
        },
        sections = {
            lualine_c = {
                {
                    'filename',
                    path = 1,              -- 0 = nombre, 1 = ruta relativa, 2 = ruta absoluta, 3 = ruta relativa a cwd
                    file_status = true,
                    newfile_status = true, -- muestra [New]
                },
            },
        },
    },

}
