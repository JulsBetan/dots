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
        local builtin   = require("telescope.builtin")
        local actions   = require("telescope.actions")
        local v         = require("telescope.config").values

        -- Tomamos los argumentos por defecto de vimgrep y les añadimos --hidden y exclusión de .git
        local vimgrep_arguments = { unpack(v.vimgrep_arguments) }
        table.insert(vimgrep_arguments, "--hidden")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!.git/")

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
                vimgrep_arguments = vimgrep_arguments,  -- 👈 AQUÍ estaba faltando
                mappings = {
                    i = {
                        ["<C-h>"]   = actions.select_horizontal,
                        ["<C-v>"]   = actions.select_vertical,
                        ["<S-Up>"]  = actions.preview_scrolling_up,
                        ["<S-Down>"] = actions.preview_scrolling_down,
                    },
                    n = {
                        ["<C-h>"]   = actions.select_horizontal,
                        ["<C-v>"]   = actions.select_vertical,
                        ["<S-Up>"]  = actions.preview_scrolling_up,
                        ["<S-Down>"] = actions.preview_scrolling_down,
                    },
                },
                file_ignore_patterns = {
                    "^%.git/",
                    "venv/",
                    "%.pyc",
                    "__pycache__/",
                    "node_modules/",
                    ".mypy_cache/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true, -- Esto incluye archivos ocultos en los resultados
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
