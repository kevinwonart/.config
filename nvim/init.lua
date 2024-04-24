require("lazyLoader")
require("core.keymap").setup()
require("core.commands").setup()

vim.cmd("set shiftwidth=2 smarttab")
vim.cmd("set expandtab")
vim.cmd("set wrap linebreak nolist")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.cmd("set clipboard+=unnamedplus")
--vim.cmd("command! E Explore")

local is_linux = vim.loop.os_uname().sysname == "Linux"
local is_wsl = is_linux and (os.getenv("WSL_DISTRO_NAME") ~= nil)

local use_wsl_clipboard = false

if is_wsl then
  use_wsl_clipboard = true
end

if use_wsl_clipboard then
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
end

vim.cmd [[ autocmd VimLeave * mksession! ~/session.vim ]]
if vim.fn.filereadable("~/session.vim") == 1 then
  vim.cmd [[ source ~/session.vim ]]
end

-- Function to check if LSP is attached and format
local function format_on_save()
  if vim.lsp.buf_get_clients() then
    vim.lsp.buf.format()
  end
end

-- Auto command to run formatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = format_on_save,
})

function load_boilerplates()
  local boilerplate_dir = vim.fn.stdpath('config') .. '/lua/boilerplate/*.lua'
  local files = vim.split(vim.fn.glob(boilerplate_dir), "\n")

  for _, file_path in ipairs(files) do
    if file_path ~= "" then
      local file = file_path:match("([^/]+)%.lua$")
      require('boilerplate.' .. file)
    end
  end
end

-- Call the function to load all boilerplate scripts
load_boilerplates()
