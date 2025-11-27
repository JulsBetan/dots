return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            -- Aquí puedes personalizar las opciones de toggleterm
            direction = "horizontal", -- Dirección del terminal (horizontal, vertical, float)
            size = 20,          -- Tamaño del terminal
            open_mapping = [[<C-j>]], -- Atajo para abrir el terminal
        }
    end
}
