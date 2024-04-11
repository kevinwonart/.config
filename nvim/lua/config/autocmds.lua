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
