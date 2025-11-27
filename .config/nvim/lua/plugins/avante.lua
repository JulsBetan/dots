return {
  "yetone/avante.nvim",
  lazy = false,
  build = "make",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
  },
  opts = {
    provider = "openai", -- por defecto

    providers = {
      openai = {
        model = "gpt-4o",
        extra_request_body = {
          -- Para OpenAI se usa max_tokens
          max_tokens = 2048,
          temperature = 0.2,
        },
      },
      claude = {
        model = "claude-sonnet-4-20250514",
        extra_request_body = {
          -- Para Anthropic se usa max_tokens también,
          -- pero aquí corresponde a tokens de salida
          max_tokens = 2048,
          temperature = 0.2,
        },
      },
    },
  },
}
