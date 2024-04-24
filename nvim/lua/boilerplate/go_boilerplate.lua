local M = {}

function M.create_go_boilerplate()
  local lines = {
    "package main",
    "",
    'import (',
    '\t"bufio"',
    '\t"fmt"',
    '\t"io"',
    '\t"os"',
    ')',
    "",
    "func main() {",
    "}",
  }

  -- Get the current buffer
  local buf = vim.api.nvim_get_current_buf()

  -- Set option to avoid auto commenting new lines
  vim.api.nvim_buf_set_option(buf, 'autoindent', false)

  -- Delete existing lines if any
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

  -- Add the boilerplate lines to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Move cursor to the body of the main function
  vim.api.nvim_win_set_cursor(0, { 11, 1 })
end

-- Register a Neovim command that runs the function
vim.api.nvim_create_user_command('GoBoilerplate', M.create_go_boilerplate, {})

return M
