# Neovim Config

Personal Neovim config built around lazy.nvim, LSP, and Telescope.

## My Setup
- lazy.nvim plugin manager with simple plugin specs in `lua/plugins/`
- LSP via mason + lspconfig (Lua, TypeScript, Python, CSS by default)
- Treesitter for modern syntax highlighting
- Telescope fuzzy finder + fzf-native
- Oil file explorer, lualine statusline, gitsigns, highlight-colors
- tokyo dark theme (tokyodark.nvim)

## Requirements
- Neovim 0.9+ (0.10+ recommended)
- git (lazy.nvim bootstrap)
- make (to build telescope-fzf-native)
- ripgrep (for `Telescope live_grep`)
- A Nerd Font (for icons in statusline and UI)

## Install
```sh
brew install neovim

brew install ripgrep

git clone https://github.com/nricaldi/nvim-config.git ~/.config/nvim
```

On first launch, lazy.nvim will install plugins automatically. LSP servers are installed via mason.

## Layout
```
init.lua
lua/
  nvim_options.lua
  config/
    lazy.lua
    lsp.lua
  plugins/
    autocomplete.lua
    git-signs.lua
    highlight-colors.lua
    lualine.lua
    mason.lua
    oil.lua
    telescope.lua
    theme.lua
    tree-sitter.lua
    vim-tmux-navigator.lua
```

## Keymaps
Leader is space. Local leader is `\`.

### Navigation
- `Ctrl-h/j/k/l`: move between Neovim splits
- `-`: open parent directory (Oil)

### Telescope
- `<leader>ff`: find files
- `<leader>fg`: live grep
- `<leader>fb`: buffers
- `<leader>fh`: help tags

### LSP
- `gR`: references (Telescope)
- `gD`: declaration
- `gd`: definition
- `gi`: implementations (Telescope)
- `gt`: type definitions (Telescope)
- `K`: hover docs
- `<leader>ca`: code actions
- `<leader>rn`: rename
- `<leader>D`: diagnostics (buffer)
- `<leader>d`: diagnostics (line)
- `[d` / `]d`: prev/next diagnostic
- `<leader>rs`: restart LSP

## Language Support
Treesitter installs: html, css, javascript, typescript, tsx, python.

Mason installs: lua_ls, ts_ls, pyright, cssls.

## Notes for Copying
- `lua/nvim_options.lua` contains core editor options and split navigation maps.
- `lua/config/lsp.lua` contains all LSP keymaps and diagnostic sign config.
- Plugin specs live in `lua/plugins/` and can be copied file-by-file.
- `lazy-lock.json` pins plugin versions for reproducible installs.

## Useful Commands
- `:Lazy` plugin manager UI
- `:Mason` LSP installer UI
- `:TSUpdate` update Treesitter parsers

## Troubleshooting
- If Telescope live grep fails, make sure `rg` is on your PATH.
- If icons look wrong, install a Nerd Font and set it in your terminal.
- If `telescope-fzf-native` fails to build, verify `make` is installed.
