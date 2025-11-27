return {
	-- "wuelnerdotexe/vim-enfocado",
	"folke/tokyonight.nvim",
   	lazy = false, -- make sure we load this during startup if it is your main colorscheme
    	priority = 1000, -- make sure to load this before all the other start plugins
    	config = function()
      	-- load the colorscheme here
     	--vim.cmd([[colorscheme enfocado]])
     	vim.cmd([[colorscheme tokyonight]])
    	end,
}

-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha", -- latte, frappe, macchiato, mocha
--             integrations = {
--                 lualine = true,
--                 treesitter = true,
--                 telescope = true,
--                 gitsigns = true,
--                 mason = true,
--                 cmp = true,
--                 nvimtree = true,
--                 notify = true,
--                 noice = true,
--                 which_key = true,
--                 mini = true,
--             },
--         })

--         vim.cmd.colorscheme("catppuccin")
--     end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Override del fondo para que coincida con tu color original
--     require("tokyonight").setup({
--       style = "storm",  -- la variante más similar a tu paleta
--       transparent = false,

--       on_colors = function(colors)
--         -- Fondo principal
--         colors.bg = "#011423"       -- Normal
--         colors.bg_dark = "#011423"  -- Sidebar, splits
--         colors.bg_float = "#011423" -- Floats
--         colors.bg_highlight = "#012234"
--         colors.bg_popup = "#011423"

--         -- Opcional: adapta los tonos para que coincidan con tu paleta original
--         colors.cyan = "#24EAF7"
--         colors.green = "#47FF9C"
--         colors.blue = "#0FC5ED"
--         colors.magenta = "#A277FF"
--       end,

--       on_highlights = function(hl, colors)
--         -- Ajustar highlights clave
--         hl.Normal = { bg = "#011423" }
--         hl.NormalFloat = { bg = "#011423" }
--         hl.FloatBorder = { bg = "#011423", fg = "#033259" }
--         hl.SignColumn = { bg = "#011423" }
--         hl.LineNr = { bg = "#011423" }
--         hl.CursorLine = { bg = "#012234" }
--         hl.CursorLineNr = { bg = "#011423", fg = colors.green }
--         hl.Visual = { bg = "#033259" }
--       end,
--     })

--     -- Cargar el colorscheme ya modificado
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
