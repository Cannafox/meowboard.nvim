local M = {}

function M.default_config()
  local defaults = require("defaults")

  return defaults
end

function M.setup(opts)
  opts = opts or M.default_config()

  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end
end

return M
