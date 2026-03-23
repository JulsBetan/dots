# Dotfiles Configuration

## Project Overview

This repository contains the personal configuration files (dotfiles) for a development environment on macOS and Linux. It is designed for a modern, high-productivity workflow centered around terminal-based tools, featuring cohesive aesthetics and consistent keybindings across different applications.

### Key Technologies
- **Shell:** Zsh with [Oh-My-Zsh](https://ohmyz.sh/) and the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme for a highly informative and fast prompt.
- **Multiplexer:** [tmux](https://github.com/tmux/tmux) for session management, using [TPM](https://github.com/tmux-plugins/tpm) and the [Catppuccin](https://github.com/catppuccin/tmux) theme.
- **Terminal:** [WezTerm](https://wezfurlong.org/wezterm/) configured via Lua for performance and rich styling (opacity, blur, Nerd Fonts).
- **Editor:** [Neovim](https://neovim.io/) (located in `.config/nvim/`) with a modular Lua-based configuration focused on LSP, autocompletion, and Git integration.
- **Git UI:** [Lazygit](https://github.com/jesseduffield/lazygit) for efficient terminal-based repository management.

## Key Files and Directories

- `.zshrc`: The main entry point for Zsh. Loads Oh-My-Zsh, plugins (like `git`), and custom aliases.
- `.p10k.zsh`: Powerlevel10k configuration for prompt styling and segments.
- `.tmux.conf`: tmux configuration including prefix (`C-s`), Vim-style pane navigation, and plugin management.
- `.wezterm.lua`: WezTerm configuration for fonts (MesloLGS Nerd Font), colors, and window transparency.
- `.config/nvim/`: Comprehensive Neovim setup. See the nested `GEMINI.md` in that directory for specific details.
- `lazygit/`: Configuration for the Lazygit terminal UI.
- `AGENTS.md`: Detailed instructions and constraints for AI agents modifying this repository.

## Usage and Maintenance

### Validation Commands
Each tool has specific commands to validate configuration changes without restarting the entire system:

| Tool | Validation / Reload Command |
| :--- | :--- |
| **Zsh** | `zsh -n .zshrc` (Syntax) / `source ~/.zshrc` (Reload) |
| **tmux** | `tmux source-file ~/.tmux.conf` |
| **WezTerm** | Relaunch application or rely on auto-reload if enabled. |
| **Neovim** | `:checkhealth` within Neovim. |
| **Lazygit** | Launch `lazygit` and check for startup warnings. |

### Development Conventions
- **Consistency:** Maintain existing indentation and quoting styles (e.g., 2-space indentation in shell scripts, tabs in WezTerm config where present).
- **Modularity:** Keep tool-specific logic isolated to its respective configuration file.
- **Safety:** Use OS guards (`uname`) and tool-presence checks (`command -v`) to ensure portability across macOS and Linux.
- **Vim Integration:** Keybindings across tmux and Neovim are synchronized via `vim-tmux-navigator`.
- **Secrets:** Never commit secrets directly; source them from a local `.secrets.zsh` file.

For more detailed technical constraints and coding styles, refer to the `AGENTS.md` file in the root directory.
