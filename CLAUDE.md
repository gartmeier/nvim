# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a customized Neovim configuration based on kickstart.nvim, a minimal, well-documented starting point for Neovim setups. The configuration emphasizes simplicity and readability while providing modern IDE-like features.

## Key Architecture

### Single-File Configuration
- **Main config**: `init.lua` - Contains the complete configuration in one file for easy understanding
- **Plugin modules**: `lua/kickstart/plugins/` - Individual plugin configurations that can be optionally enabled
- **Custom plugins**: `lua/custom/plugins/` - Directory for user-specific plugin additions

### Plugin Management
- Uses **lazy.nvim** for plugin management with lazy loading
- Plugins are configured inline within `init.lua` or as separate modules in `lua/kickstart/plugins/`
- Plugin installation and updates managed via `:Lazy` command

### LSP and Development Tools
- **LSP**: Automatic language server installation via Mason
- **Completion**: Uses blink.cmp for autocompletion
- **Formatting**: Conform.nvim handles code formatting
- **Navigation**: Telescope for fuzzy finding, Harpoon 2 for quick file access

## Key Customizations

### Indentation Standards
- **Global default**: 2 spaces (expandtab=true, shiftwidth=2)
- **Python**: 4 spaces (via FileType autocmd)
- **No tabs**: All indentation uses spaces

### Formatters Configuration
```lua
formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'ruff_format', 'ruff_organize_imports' },
  javascript = { 'prettierd', 'prettier', stop_after_first = true },
  typescript = { 'prettierd', 'prettier', stop_after_first = true },
  -- ... other web formats
}
```

### Essential Keymaps
- **Leader key**: `<space>`
- **File explorer**: `\` (Neo-tree on right side)
- **Format buffer**: `<leader>f`
- **Harpoon navigation**: `<leader>a` (add), `<leader>h` (menu), `<leader>1-4` (quick access)
- **LSP actions**: `gr*` prefix (grn=rename, gra=action, grr=references, etc.)

### Enabled Plugins
- **neo-tree**: File explorer (replaces netrw, positioned right)
- **autopairs**: Automatic bracket/quote pairing
- **harpoon**: Quick file navigation
- **auto-dark-mode**: Automatic theme switching (catppuccin-mocha/latte)

## Common Commands

### Plugin Management
- `:Lazy` - Open plugin manager interface
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins

### Development Tools
- `:Mason` - Open LSP/formatter installer
- `:ConformInfo` - Check formatter status
- `:GuessIndent` - Detect and set indentation for current buffer
- `:checkhealth` - Verify Neovim setup

### Configuration Reload
- `:source $MYVIMRC` - Reload config (limited with lazy.nvim)
- Better: Restart Neovim for full reload

## Dependencies

### Required External Tools
- **ripgrep** (`rg`) - For Telescope search
- **fd-find** (`fd`) - For Telescope file finding
- **Nerd Font** - For icons (enabled: `vim.g.have_nerd_font = true`)

### Formatters (install via npm/pip/Mason)
- **prettierd** or **prettier** - JavaScript/TypeScript/CSS/HTML/JSON
- **stylua** - Lua formatting
- **ruff** - Python formatting and import sorting

## File Structure Notes

### Critical Files
- `init.lua` - Main configuration file, heavily documented
- `lazy-lock.json` - Plugin version lockfile (should be tracked in git)
- `lua/kickstart/plugins/*.lua` - Optional plugin configurations

### Theme Configuration
- Auto-switches between catppuccin-mocha (dark) and catppuccin-latte (light)
- Netrw disabled to prevent conflicts with neo-tree
- Relative line numbers enabled for easier navigation

## Development Workflow

1. **File Navigation**: Use Harpoon (`<leader>a` to add files, `<leader>1-4` for quick access)
2. **Code Formatting**: Automatic on save, manual with `<leader>f`
3. **LSP Features**: Use `gr*` keymaps for language server operations
4. **Search**: Telescope with `<leader>s*` keymaps for various search modes