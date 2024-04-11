-- File: ~/.config/nvim/lua/core/commands.lua
local M = {}
M.setup = function()
  vim.api.nvim_create_user_command('IncLine', 's/\\v([a-zA-Z]+)\\zs(\\d+)/\\=submatch(0)+1/g | nohlsearch', {})
  vim.api.nvim_create_user_command('DecLine', 's/\\v([a-zA-Z]+)\\zs(\\d+)/\\=submatch(0)-1/g | nohlsearch', {})
end
return M
