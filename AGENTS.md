# Dotfiles Agent Guide

## Scope
- These rules apply to the entire `dotfiles` repository.
- For Neovim work, also follow `.config/nvim/AGENTS.md` (it is more specific).
- If two rules conflict, prefer the more specific file for that subtree.

## Repository Map
- `.zshrc`: interactive shell config (aliases, exports, startup behavior).
- `.tmux.conf`: keybindings, statusline theme, TPM plugins.
- `.wezterm.lua`: terminal UI and runtime behavior.
- `lazygit/Library/Application Support/lazygit/config.yml`: LazyGit options.
- `.config/nvim/`: Lua-based Neovim setup (plugins, settings, lazy.nvim).
- `.config/opencode/package.json`: minimal dependency pinning.
- `Brewfile`: machine package bootstrap list.

## Build, Lint, and Test Commands
This repo has no single global build/test pipeline. Validate only what you changed.

### Quick Commands by Area
- Zsh syntax check: `zsh -n .zshrc`
- Zsh load check: `zsh -ic 'source ~/.zshrc'`
- Tmux reload config: `tmux source-file ~/.tmux.conf`
- Tmux fresh session smoke test: `tmux new -d -s dotfiles_test && tmux kill-session -t dotfiles_test`
- WezTerm config check: `wezterm start --always-new-process >/dev/null 2>&1` (manual visual validation still required)
- Neovim clean boot: `nvim --clean -u .config/nvim/init.lua`
- Neovim plugin sync: `nvim --headless "+Lazy sync" +qa`
- Neovim health check: `nvim --headless "+checkhealth" +qa`
- LazyGit config smoke test: `lazygit --use-config-file="lazygit/Library/Application Support/lazygit/config.yml"`

### Single-Test Equivalents (Targeted Validation)
Use one narrow command that matches the edited area.

- If `.zshrc` alias/function changed:
  `zsh -ic 'source ~/.zshrc; <alias-or-function> --help >/dev/null 2>&1 || true'`
- If a tmux keybind changed:
  reload config, then trigger only that bind in one session.
- If tmux theme/status changed:
  reload and verify statusline rendering only.
- If `.wezterm.lua` changed:
  relaunch WezTerm and verify only edited settings (font, colors, tabs, etc).
- If Neovim plugin config changed:
  run `nvim --headless "+Lazy sync" +qa`, then open one representative filetype.
- If Neovim keymaps/autocmd changed:
  boot Neovim and test exactly that map/autocmd behavior.

### No Existing Unit-Test Framework
- There is no `npm test`, `pytest`, `go test`, or `cargo test` workflow at repo root.
- Treat focused runtime checks as the test strategy for this repository.

## Style Guide
Keep edits minimal, local, and consistent with surrounding file style.

### General Editing Rules
- Preserve file structure and ordering unless reordering is required.
- Do not reformat unrelated blocks.
- Keep comments short and only for non-obvious choices.
- Preserve existing Spanish comments/messages where present.
- Prefer explicit configuration over clever abstractions.

### Imports and Module Loading
- Lua: `local x = require("module")` near first use or top-level when reused.
- Avoid introducing global Lua symbols.
- Shell: guard optional tools with `command -v tool >/dev/null 2>&1`.
- Avoid eager `eval` unless already part of existing pattern.

### Formatting and Layout
- `.zshrc`: 2-space indentation in control blocks.
- `.tmux.conf`: one directive per line; keep plugin and theme blocks grouped.
- `.wezterm.lua`: keep existing indentation and `config` table style.
- YAML files: preserve exact indentation and key style.
- Keep logical blank lines between sections.

### Types and Data Shapes
- Lua tables should be explicit and stable; avoid shape-changing logic.
- Use booleans (`true`/`false`) and explicit string values.
- Do not invent new config keys unless documented by the tool/plugin.

### Naming Conventions
- Shell function names: `snake_case`.
- Environment variables: `UPPER_CASE`.
- Lua locals/functions: `snake_case`.
- Alias names: short, descriptive, and consistent with existing aliases.

### Error Handling and Safety
- Prefer safe fallbacks over hard failures for optional dependencies.
- Keep startup paths fast; avoid long-running install/update commands at boot.
- Never remove guards around missing tools unless replacing with better guards.
- Quote variable expansions in shell unless intentional word splitting is needed.
- Avoid destructive commands in startup config.

## Tool-Specific Notes

### Zsh (`.zshrc`)
- Keep PATH updates idempotent and avoid duplicates.
- Use `$HOME` instead of hard-coded user paths when possible.
- Group exports, aliases, and tool bootstrap blocks clearly.

### Tmux (`.tmux.conf`)
- Use `set -g`/`setw -g` for globals.
- Keep TPM plugin declarations in one contiguous block.
- Keep keybind additions close to related navigation/split bindings.

### WezTerm (`.wezterm.lua`)
- Keep all settings within one returned config table.
- Prefer static values over computed side effects.
- Validate visually after edits; some failures are runtime/UI only.

### Neovim (`.config/nvim`)
- Read and follow `.config/nvim/AGENTS.md` before changing files.
- Do not edit `lazy-lock.json` manually.
- Validate with clean boot and health checks after plugin changes.

### LazyGit (`lazygit/.../config.yml`)
- Keep keys ordered as currently structured in the file.
- Prefer explicit booleans and avoid implicit YAML shortcuts.

## Secrets, Local State, and Generated Files
- Never commit secrets, tokens, or machine-specific credentials.
- Do not commit caches or generated runtime artifacts.
- If a tool generates local files, keep them ignored.
- Avoid adding absolute local paths unless the repo already depends on them.

## Review Checklist for Agents
- Confirm edited file loads without errors.
- Confirm no duplicate PATH/export/alias entries were introduced.
- Confirm changed keybinds do not conflict with nearby mappings.
- Confirm plugin/theme changes remain in their existing section.
- Confirm only relevant files were modified.

## Cursor and Copilot Rules
- No `.cursor/rules/` files found.
- No `.cursorrules` file found.
- No `.github/copilot-instructions.md` file found.
- If these files are added later, merge their instructions into this guide.

## Agent Workflow Expectations
- Prefer targeted checks over broad exploratory edits.
- Keep diffs small and purpose-driven.
- Explain why a config change is needed, not just what changed.
- For Neovim-specific tasks, report both Lazy and runtime validation results.

## Git and Change Scope
- Do not revert unrelated local edits in a dirty working tree.
- Never use destructive git commands (`reset --hard`, `checkout --`) unless requested.
- Do not edit lockfiles manually unless the tool generated the change.
- Avoid broad refactors for style-only reasons in config files.
- Keep commits focused per tool area (zsh/tmux/wezterm/nvim/lazygit).
- In reviews, call out any machine-specific assumptions introduced by a change.
- If a validation command cannot run locally, state what was skipped and why.
