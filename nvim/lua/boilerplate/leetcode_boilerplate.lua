local M = {}

function M.insert_boilerplate()
  local lines = {
    "//",
    "",
    "/*",
    " *",
    " */",
    "",
    "/* Summary:",
    " *",
    " *",
    " */",
  }

  -- Get the current buffer
  local buf = vim.api.nvim_get_current_buf()

  -- Set option to avoid auto commenting new lines
  vim.api.nvim_buf_set_option(buf, 'autoindent', false)

  -- Delete existing lines if any
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

  -- Add the boilerplate lines to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Move cursor to the first line of the Summary
  vim.api.nvim_win_set_cursor(0, { 8, 3 }) -- Place cursor at the start of the Summary section
end

--
-- Register the Neovim command
vim.api.nvim_create_user_command('LeetcodeBoiler', M.insert_boilerplate, {})
return M
