return {
  'tpope/vim-commentary',
  config = function()
    vim.api.nvim_set_keymap('n', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('x', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })
  end
}
