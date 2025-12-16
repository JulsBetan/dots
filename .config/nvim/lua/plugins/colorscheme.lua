--return {
--	-- "wuelnerdotexe/vim-enfocado",
--	"folke/tokyonight.nvim",
--   	lazy = false, -- make sure we load this during startup if it is your main colorscheme
--    	priority = 1000, -- make sure to load this before all the other start plugins
--    	config = function()
--      	-- load the colorscheme here
--     	--vim.cmd([[colorscheme enfocado]])
--     	vim.cmd([[colorscheme tokyonight]])
--    	end,
--}

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
-- --
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
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = false -- set to true if you would like to enable transparency

    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
      on_highlights = function(hl, c)
        -- Set background for transparent mode
        if transparent then
          hl.Normal = { bg = "NONE" }
          hl.NormalNC = { bg = "NONE" } -- Not-current windows
          hl.NormalFloat = { bg = "NONE" }
        end

        -- Customize other highlights
        hl.TreesitterContext = {
          bg = c.bg_highlight,
        }
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}
