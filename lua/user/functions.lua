local M = {}

function M.copy_relative_path()
  local plenary = require 'plenary.path'
  local parsed_path = vim.api.nvim_buf_get_name(0)
  local relative_path = plenary:new(parsed_path):make_relative(vim.fn.getcwd())
  vim.fn.setreg('+', relative_path)
end
function M.copy_path()
  local path =  vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', path)
end


return M
