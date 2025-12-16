vim.o.number = true
vim.o.relativenumber = true
-- Configuración general de tabulación
vim.opt.tabstop = 4       -- Número de espacios que corresponde a un tabulador
vim.opt.softtabstop = 4   -- Número de espacios que se usan al editar con la tecla Tab
vim.opt.shiftwidth = 4    -- Número de espacios que se usan para la indentación
vim.opt.expandtab = true  -- Convierte tabuladores en espacios
vim.g.mapleader = " "
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.opt.cursorline = true -- Resaltar numero de linea actual

vim.keymap.set("n", "<leader>nr", function()
         vim.opt.relativenumber = not vim.opt.relativenumber:get()
     end, { desc = "Toggle relative numbers" })


-- Navegación entre ventanas desde modo terminal
-- Salir de modo terminal con Escape (usando autocmd para que funcione con OpenCode)
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = true, desc = 'Salir de modo terminal' })
    end
})

-- Ajustes de tabulación específicos por tipo de archivo
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "vue" },
    callback = function()
        print("Forzando configuración de tabulación para " .. vim.bo.filetype)
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
    end
})

-- Configuracion de plegado (folding)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99 -- Para mantener los pliegues abiertos por defecto
vim.o.foldenable = true

vim.keymap.set("n", "<leader>Y", ':%y+<CR>', { desc = "Copy entire file to system clipboard" })
