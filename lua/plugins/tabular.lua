return {
  "dhruvasagar/vim-table-mode",
  config = function()
    -- Enable table mode and set the corner character
    vim.g.table_mode_corner = '|'

    -- Set up the keymap for realigning tables
    vim.api.nvim_set_keymap('n', '<leader>at', ':TableModeRealign<CR>', { noremap = true, silent = true })

    -- Automatically enable TableMode for markdown files
    vim.cmd([[
      autocmd FileType markdown TableModeEnable
    ]])
  end,
}
