return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    opts = {
      -- Optional: custom configuration
    },
    config = function()
      vim.g.db_ui_save_location = '~/.config/dadbod-ui'

      -- vim.g.db_ui_use_nerd_fonts = 1
      -- vim.g.db_ui_show_database_icon = 1

      -- Set DBUI drawer indentation
      vim.cmd [[
                autocmd FileType dbui setlocal shiftwidth=2
                autocmd FileType dbui setlocal tabstop=2
            ]]

      -- Optional: DB completion in SQL files
      local cmp = require 'cmp'
      cmp.setup.filetype({ 'sql' }, {
        sources = {
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' },
        },
      })

      -- Optional: Key mappings
      vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>')
      vim.keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>')
      vim.keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>')
      vim.keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>')
    end,
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    keys = {
      { '<leader>db', ':DBUIToggle<CR>' },
      { '<leader>df', ':DBUIFindBuffer<CR>' },
    },
  },
}
