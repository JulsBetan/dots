
return {
  "nvim-treesitter/nvim-treesitter",
  commit = "310f0925ec64c7e54f3ee952679d285b13e5a735",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build        = ":TSUpdate",
  lazy         = false,
  main         = "nvim-treesitter.configs",
  opts         = {
    ensure_installed = {
      "xml",
      "vue",
      "lua",
      "html",
      "luadoc",
      "query",
      "yaml",
      "python",
      "typescript",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    fold = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["at"] = "@tag.outer",
          ["it"] = "@tag.inner",
        }
      }
    }
  },
}
