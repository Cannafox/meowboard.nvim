local M = {}

function M.redraw()
end

function M.setup(opts)
  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end
end

return M
