# Dotfiles Agent Guidelines

## Scope
These guidelines apply to the entire `dotfiles` repo. There is a more specific
`AGENTS.md` under `.config/nvim/`; follow it for any Neovim-related changes.

## Repository Layout
- `.zshrc` contains interactive shell config and aliases.
- `.tmux.conf` holds tmux bindings, plugins, and theme settings.
- `.wezterm.lua` defines the WezTerm terminal configuration in Lua.
- `lazygit/Library/Application Support/lazygit/config.yml` is LazyGit config.
- `.config/nvim/` contains the Neovim Lua config (see nested rules).

## Build, Lint, and Test Commands
There is no formal build or test runner for this repo. Use the commands below
for targeted validation of the edited file or tool.

### Shell/Zsh
- Syntax check: `zsh -n .zshrc`
- Reload in current shell: `source ~/.zshrc`
- Single change validation: re-run the affected alias or function manually.

### Tmux
- Reload config in a tmux session: `tmux source-file ~/.tmux.conf`
- Quick sanity check: open a new session and verify keybinds.
- Single change validation: trigger only the updated binding/theme entry.

### WezTerm
- Manual check: launch WezTerm and verify the UI matches `.wezterm.lua`.
- Single change validation: adjust only one config field and relaunch.

### Neovim
- Follow `.config/nvim/AGENTS.md` for detailed commands.
- Typical command: `nvim --clean -u init.lua` (from the nested guide).

### LazyGit
- Manual check: open LazyGit and ensure config values are accepted.

### Single-Change Validation Checklist
- Keep validations narrow to the edited file or setting.
- For shell changes, open a new terminal and confirm startup.
- For tmux, reload and check only the modified keybind.
- For WezTerm, relaunch and confirm colors/fonts only.
- For Neovim, follow `.config/nvim/AGENTS.md` and confirm `:checkhealth`.
- For LazyGit, ensure no warnings appear at startup.

## Coding Style Guidelines
Keep edits minimal and consistent with the existing file. Match indentation,
quotes, and comment style that already exists in the file you touch.

### General
- Keep configuration declarative; avoid heavy logic unless necessary.
- Prefer explicit, readable settings over clever one-liners.
- Keep OS-specific logic guarded with `uname` checks.
- Group related settings with blank lines or short headers.
- Avoid duplicating PATH exports or alias definitions.
- Favor idempotent exports and checks on startup.
- Do not add inline comments unless needed for clarity.
- Do not reorder unrelated settings without a reason.
- Preserve Spanish comments when present.

### Shell/Zsh (`.zshrc`)
- Use 2-space indentation inside `if`/`case` blocks.
- Prefer `[[ ... ]]` for tests, and always quote variables.
- Guard optional tools with `command -v tool >/dev/null 2>&1`.
- Environment variables are UPPER_CASE; locals are lower_case.
- Use `alias name='command'` for simple shortcuts.
- Keep related exports grouped (e.g., PATH, language managers).
- Avoid exporting secrets; source them from `.secrets.zsh` only.
- Use `command -v` checks before `eval` or `source` calls.
- Keep PATH exports idempotent and avoid duplicates.
- Keep OS-specific PATH changes under `uname` checks.

### Tmux (`.tmux.conf`)
- One directive per line; keep the order stable.
- Prefer `set -g`/`setw -g` for global options.
- Keep plugin declarations together at the top or in a labeled block.
- Comments can be short and may be in Spanish (as in existing config).
- Avoid multiline commands unless tmux requires `\` escaping.
- Use `bind-key` long form when adding new bindings.
- Avoid reusing keys already bound by tmux defaults.
- Keep theme-related options grouped together.

### WezTerm (`.wezterm.lua`)
- Use `local` for module imports and config variables.
- Keep configuration in a single `config` table.
- Match existing indentation (tabs in this file).
- Prefer hex strings for colors; avoid computed values.
- Keep font/opacity/window settings grouped for readability.
- Avoid global variables; return only the `config` table.
- Prefer direct assignments over helper functions.

### LazyGit (`config.yml`)
- Preserve YAML indentation exactly (2 spaces).
- Avoid adding new keys unless documented by LazyGit.
- Prefer explicit booleans (`true`/`false`) over implicit values.
- Keep keys in the same order as existing blocks.

## Error Handling and Safety
- Prefer no-op checks over hard failures when tools are missing.
- Keep shell guards around optional tools (e.g., `fd`, `eza`, `bat`).
- Avoid removing existing safety checks or OS guards.
- Do not commit machine-specific paths unless they are already present.
- Avoid auto-install or update commands in shell startup.
- Keep exports side-effect free and fast on startup.
- When adding defaults, prefer safe fallbacks over aborting.

## Paths and OS Considerations
- Keep macOS/Linux blocks separated by `uname` checks.
- Use `$HOME` instead of hard-coded user paths.
- Avoid adding new absolute paths unless already present.
- When extending PATH, prepend or append once.
- Quote values that may include spaces.
- Prefer `export VAR="value"` for clarity.

## Secrets and Local Files
- Store secrets in `.secrets.zsh` and never commit them.
- Avoid adding cache directories (e.g., `.cache`, `.mypy_cache`).
- Keep generated plugin data out of the repo.
- Use `.gitignore` if a tool creates new caches.

## Imports, Types, and Naming
- Lua: use `local module = require("module")` at the top.
- Lua: prefer `snake_case` for locals, keep globals out of config.
- Shell: functions should be `snake_case`, aliases short and readable.
- Tmux: option names mirror tmux defaults; do not rename.

## Formatting
- Keep line length reasonable but do not reflow existing blocks.
- Preserve blank lines that separate logical sections.
- Do not reorder unrelated settings without a reason.

## Change Review Checklist
- Confirm the edited tool starts without errors.
- Verify new aliases or binds do not shadow existing ones.
- Check for duplicate exports after PATH changes.
- Ensure theme-related tweaks stay grouped together.
- Keep new entries near similar settings.

## Cursor/Copilot Rules
- No `.cursor/rules`, `.cursorrules`, or `.github/copilot-instructions.md`
  files are present in this repository.

## Notes for Agentic Changes
- If editing Neovim files, read `.config/nvim/AGENTS.md` first.
- Do not edit `lazy-lock.json` manually (per nested rules).
- Avoid committing generated or machine-specific cache files.
- Keep changes scoped to the requested tool or config.
