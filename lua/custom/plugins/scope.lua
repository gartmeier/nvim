return {
  'tiagovla/scope.nvim',
  config = function()
    vim.keymap.set('n', '<leader>ta', ':tabnew<CR>', { desc = 'New tab' })
    vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
    vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Close other tabs' })
    vim.keymap.set('n', 'H', ':tabprevious<CR>', { desc = 'Previous tab' })
    vim.keymap.set('n', 'L', ':tabnext<CR>', { desc = 'Next tab' })
  end,
}
