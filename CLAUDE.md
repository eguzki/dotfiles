# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A dotfiles repo that installs a Linux development environment. Two entry-point scripts drive everything:

- `install_system.sh` — runs as root; installs OS packages for Ubuntu or Fedora
- `install_user.sh` — runs as the current user; downloads and installs user-level tools

## Testing changes

Development is done inside Docker to avoid polluting the host:

```bash
# Ubuntu
docker build -f Dockerfile.ubuntu -t myubuntu .
docker run --rm -ti -v $PWD:/home/apprunner/dotfiles myubuntu /bin/bash

# Fedora
docker build -f Dockerfile.fedora -t myfedora .
docker run --rm -ti -v $PWD:/home/apprunner/dotfiles myfedora /bin/bash
```

Inside the container, run the install scripts normally:
```bash
sudo bash install_system.sh
bash install_user.sh
```

## Architecture

### Tool installation pattern

Every user-level tool lives under `user/<toolname>/` and must follow this convention:

1. **`functions.sh`** — defines a bash function `install_<toolname>()`. This function:
   - Sets `VERSION`, `INSTALL_DIR` (always `$HOME/apps/<tool>-<version>`), and `DOWNLOAD_URL`
   - Returns early if `$INSTALL_DIR` already exists (idempotent)
   - Downloads the binary, extracts it, cleans up temp files
   - Writes a shell snippet to `~/.bashrc.d/<toolname>` to add the tool to `$PATH`

2. **`install_user.sh`** — must `source` the new `functions.sh` and call `install_<toolname>()` explicitly. New tools must be added to both the `source` block and the call block at the bottom.

The `~/.bashrc.d/` mechanism is set up by `install_user_defined_bash_functions` (in `user/misc/user_defined_bash_functions.sh`), which appends a loader to `~/.bashrc`. All tools depend on this running first.

Logging uses `_logInfo`, `_logWarn`, `_logError` from `helper/logging.sh`.

### System packages

`system/ubuntu/functions` and `system/fedora/functions` each define a single `install_packages()` function. `install_system.sh` detects the distro and sources the matching file.

### Neovim configuration

The nvim config lives at `user/nvim/nvim/` and is copied verbatim to `~/.config/nvim` by `install_nvim_config()`. The structure follows the standard lazy.nvim layout:

- `init.lua` — loads `config.{options,keymaps,autocommands,lazy}` in order
- `lua/config/lazy.lua` — bootstraps lazy.nvim and does `{ import = "plugins" }`, so every file under `lua/plugins/` is auto-imported as a plugin spec
- `lua/config/options.lua` — vim options (leader is `<space>`, Nerd Font enabled, 2-space indent)
- `lua/config/keymaps.lua` — global keymaps (`<leader>e` for file tree, `<C-hjkl>` for splits)
- `lua/plugins/` — one file per plugin or plugin group

**Active LSP servers** (managed by Mason): `gopls`, `rust_analyzer`, `ts_ls`, `yaml-language-server`, `jsonls`, `lua_ls`, `marksman`, `bashls`.

**Auto-formatters** (conform.nvim, triggered on save): `stylua` (Lua), `eslint_d` (JS/TS), `gofmt` (Go), `rustfmt` (Rust), `markdownlint` (Markdown), `shfmt` (Bash/sh), `yamlfmt` (YAML), `prettier` (JSON). Format-on-save is disabled for `c`, `cpp`, `yaml`, `json` filetypes.

**Telescope keymaps** (prefix `<leader>s`): `sf` files, `sg` live grep, `sw` word under cursor, `son` Obsidian notes, `sog` grep in Obsidian.

### Claude Code plugins

`user/claude/local-marketplace/` is a local Claude Code plugin marketplace. `install_claude_plugins()` copies it to `~/.claude/plugins/local`. Currently contains the `personal-skills` plugin with `clipboard` and `english` skills.

## Adding a new user-level tool

1. Create `user/<toolname>/functions.sh` following the existing pattern (versioned install dir, idempotent check, `~/.bashrc.d/<toolname>` snippet).
2. Add `source $CURRENT_PATH/user/<toolname>/functions.sh` to `install_user.sh`.
3. Add `install_<toolname>` call at the bottom of `install_user.sh`.

## Adding a new nvim plugin

Create `user/nvim/nvim/lua/plugins/<pluginname>.lua` returning a lazy.nvim plugin spec table. It is auto-loaded — no registration needed elsewhere.
