vim.keymap.set('n', '\\', ';', { noremap = true })

return {
  {
    'otavioschwanck/arrow.nvim',
    opts = {
      show_icons = true,
      leader_key = ';', -- Recommended to be a single key
    },
  },
}
