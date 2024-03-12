require("lazyLoader")

vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', {noremap = true, silent = true}) --toggle tab
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', {noremap = true, silent = true}) --toggle tab
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { noremap = true, silent = true }) --remap toggle up in autocomplete menu
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { noremap = true, silent = true }) --remap toggle dwn in autocomplete menu
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', {noremap = true, silent = true})--tabnew

vim.cmd("set shiftwidth=2 smarttab")
vim.cmd("set expandtab")
vim.cmd("set wrap linebreak nolist")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.cmd("set clipboard+=unnamedplus")

vim.api.nvim_set_var('clipboard', {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("replace("`r", ""))',
  },
  cache_enabled = 0,
})

vim.cmd [[ autocmd VimLeave * mksession! ~/session.vim ]]
if vim.fn.filereadable("~/session.vim") == 1 then
    vim.cmd [[ source ~/session.vim ]]
end

