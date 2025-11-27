return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = require('telescope.actions').select_horizontal,
                        ["<C-v>"] = require('telescope.actions').select_vertical,
                    },
                    n = {
                        ["<C-h>"] = require('telescope.actions').select_horizontal,
                        ["<C-v>"] = require('telescope.actions').select_vertical,
                    },
                },
                file_ignore_patterns = {
                    "^%.git/",
                    "venv/",
                    "%.pyc",          -- ignora archivos compilados
                    "__pycache__/",
                    "node_modules/",
                    ".mypy_cache/",
                }, -- Ignorar carpetas ocultas específicas
            },
            pickers = {
                find_files = {
                    hidden = true,  -- Esto incluye archivos ocultos en los resultados
                },
            },
        }

        -- Cargar la extension fzf
        telescope.load_extension('fzf')

        -- Mapeos de teclado
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
    end
}
