# Neovim Configuration

## Project Overview

This is a Neovim configuration written in Lua. It uses `lazy.nvim` as a plugin manager and is structured to be modular, with settings, plugins, and other configurations separated into different files and directories.

The configuration is built around a modern development workflow, with a focus on features like autocompletion, LSP integration, and a pleasant user interface.

## Key Files and Directories

*   `init.lua`: The main entry point for the configuration. It simply loads the `config` module.
*   `lua/config/init.lua`: Loads the core configuration files, `settings.lua` and `lazy.lua`.
*   `lua/config/settings.lua`: Contains general Neovim settings, such as line numbers, tab widths, and key mappings.
*   `lua/config/lazy.lua`: Sets up the `lazy.nvim` plugin manager and specifies that plugin configurations are located in the `lua/plugins` directory.
*   `lua/plugins/`: This directory contains the configuration for all the plugins used in this Neovim setup. Each file in this directory corresponds to a specific plugin or a group of related plugins.

## Building and Running

This is a Neovim configuration, so there is no "build" process. To use this configuration, you need to:

1.  Have Neovim installed on your system.
2.  Clone this repository to the appropriate location for your operating system. For Linux and macOS, this is typically `~/.config/nvim`.
3.  Start Neovim. The `lazy.nvim` plugin manager should automatically install all the configured plugins.

## Development Conventions

The configuration is written in Lua and follows standard Lua conventions. The code is organized into modules, with each module having a specific purpose.

*   **Settings:** All general Neovim settings are located in `lua/config/settings.lua`.
*   **Plugins:** All plugin configurations are located in the `lua/plugins/` directory. Each plugin has its own file, which makes it easy to manage and update plugin configurations.
*   **Key Mappings:** Key mappings are defined in `lua/config/settings.lua` and within the plugin configuration files where they are relevant.
