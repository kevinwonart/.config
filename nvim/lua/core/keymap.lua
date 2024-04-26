-- File: ~/.config/nvim/lua/core/keymap.lua
local M = {}

local function clear_highlight_if_active()
  vim.cmd [[
  function! ClearHighlightIfActive()
    if v:hlsearch
      nohlsearch
      redraw
    endif
  endfunction
  ]]
end

M.setup = function()
  clear_highlight_if_active()

  vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true }) --toggle tab
  vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })     --toggle tab
  vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { noremap = true, silent = true })            --remap toggle up in autocomplete menu
  vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { noremap = true, silent = true })            --remap toggle dwn in autocomplete menu
  vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })      --tabnew
  vim.api.nvim_set_keymap('n', ':E', ':Ex<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true })
end
return M
