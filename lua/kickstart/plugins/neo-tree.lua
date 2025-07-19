-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = true,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      position = 'right',
    },
    filesystem = {
      filtered_items = {
        visible = false, -- Hide filtered items by default
        hide_dotfiles = false, -- Show dotfiles (files starting with .)
        hide_gitignored = false, -- Show gitignored files
        hide_by_name = {
          '__pycache__',
          '.DS_Store',
          '.idea',
          '.ruff_cache',
          'node_modules',
          'thumbs.db',
        },
        hide_by_pattern = {
          '*.pyc',
          '*.pyo',
          '*.tmp',
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['H'] = 'toggle_hidden', -- Toggle hidden files with H key
        },
      },
    },
  },
}
