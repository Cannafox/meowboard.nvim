local M = {}

function M.redraw()
  local buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buffer)
end

function M.setup(opts)
  opts = opts or {}

  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end
end

return M
