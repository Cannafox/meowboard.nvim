local M = {}

function M.toggle(buffer)
  vim.api.nvim_open_win(buffer, false, {relative='win', row=10, col=10, width=40, height=40})
  -- vim.api.nvim_set_current_buf(buffer)
end

function M.setup(opts)
  opts = opts or {}

  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end
end

return M
