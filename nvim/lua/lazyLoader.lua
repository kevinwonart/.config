vim.g.mapleader = " "
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

local function load_plugins()
  local plugins = {}
  local pluginPath = vim.fn.stdpath('config') .. '/lua/plugins'
  local scan= vim.fn.globpath(pluginPath, '*.lua')

  for _, file in ipairs(vim.split(scan, '\n')) do
    if file ~= "" then
      local filename = file:match("^.+/(.+).lua$")
      local plugin_module = "plugins." .. filename
      local plugin_config = require(plugin_module)

      table.insert(plugins, plugin_config)
    end
  end

  return plugins
end
local plugins = load_plugins()

--[[
local plugins = {
  { "williamboman/mason-lspconfig.nvim" },
  {},
  { "ntk148v/habamax.nvim", name = "habamax", dependencies={ "rktjmp/lush.nvim" }, priority = 1000 },
  { "catppuccin/nvim", priority = 1000 },
  { 
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "sharkdp/fd"}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
  },
}
--]]

require("lazy").setup(plugins)
local builtin = require("telescope.builtin")

require('lush')(require('lush_theme.habamax'))
vim.cmd("colorscheme habamax")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
