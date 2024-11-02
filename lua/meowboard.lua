local M = {}

function M.default_config()
  local defaults = require("static.defaults")

  return defaults
end

function M.set_keymaps(keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
  end
end

function M.setup(opts)
  opts = opts or M.default_config()

  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end

  local default_keymaps = require("static.keymaps")
  M.set_keymaps(default_keymaps)
end

return M
