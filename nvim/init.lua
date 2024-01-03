vim.cmd("set shiftwidth=2 smarttab")
vim.cmd("set expandtab")
vim.cmd("set wrap linebreak nolist")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
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
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', {noremap = true, silent = true})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "ntk148v/habamax.nvim", name = "habamax", dependencies={ "rktjmp/lush.nvim" }, priority = 1000 },
  { "catppuccin/nvim", priority = 1000 },
  { 
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "sharkdp/fd"}
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"  },
}

require("lazy").setup(plugins)
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
require('lush')(require('lush_theme.habamax'))
vim.cmd("colorscheme habamax")
