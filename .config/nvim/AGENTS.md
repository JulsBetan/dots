# Repository Guidelines

## Project Structure & Module Organization
`init.lua` is the single entry point and only sets up lazy.nvim plus `lua/config/init.lua`. Shared options live in `lua/config/settings.lua`, while plugin-specific tweaks sit under `lua/config/plugins/`. Every plugin spec belongs in `lua/plugins/*.lua` and must return a Lazy table with `event`/`opts` declared inline when possible. `lazy-lock.json` pins plugin versions; never edit it manually. Use `nvim.log` only for debugging output and keep it out of commits.

## Build, Test, and Development Commands
There is no external build. Run `nvim --clean -u init.lua` to ensure the config works on a pristine instance. Execute `nvim "+checkhealth"` before submitting to confirm providers are available. Sync plugins with `nvim --headless "+Lazy sync" +qa`. Reload a single file after editing via `:source %` or restart Neovim to validate autocmds.

## Coding Style & Naming Conventions
All config is written in Lua with 4-space indentation (TypeScript/Vue snippets stick to 2). Prefer compact tables: `return { "nvim-telescope/telescope.nvim", event = "VeryLazy", opts = { defaults = {...} } }`. Keep comments brief, Spanish is acceptable. Always `require("module.path")` inline unless reused several times. Local variables, functions, and modules use `snake_case`. Enforce shared `on_attach` logic for every LSP server to keep mappings (`gd`, `gr`, `K`, `<leader>rn`, `<leader>ca`) consistent.

## Testing Guidelines
No automated suite exists. After changes, run `:checkhealth`, trigger core workflows (`:Lazy`, `:Mason`, tree-sitter installs), and open representative buffers (Lua, TypeScript, Vue) to verify filetype autocmds defined in `lua/config/settings.lua`. Use `:messages` to watch for Lua errors and keep `:lua vim.notify` noise minimized.

## Commit & Pull Request Guidelines
History favors short, descriptive Spanish imperatives (e.g., `plugin lualine ajuste telescope treesitter`). Reference the feature in the first word, keep tense present, and bundle related tweaks together. Pull requests should summarize user-facing changes, list manual test steps (`nvim "+checkhealth"`, `:source %`), and mention any impacted plugins or keymaps. Include screenshots/GIFs when UI plugins (statusline, telescope, dashboard) change behavior.

## Security & Configuration Tips
Do not commit machine-specific secrets, API keys, or `:Mason` downloads. Use `.gitignore` if a plugin generates cache files. Validate new plugins through `lazy-lock.json` to ensure reproducible installs and avoid pinning to local paths. Review `lua/config/settings.lua` before shipping to confirm per-file overrides do not leak absolute directories or home-specific references.
