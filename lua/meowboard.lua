local M = {}

function M:get_default_config()
  local defaults = require("static.defaults")

  return defaults
end

function M:set_keymaps(keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
  end
end

function M:create_autocommands(autocommands)
  for _, autocommand in ipairs(autocommands) do
    vim.api.nvim_create_user_command(autocommand[1], autocommand[2], autocommand[3])
  end
end

function M:toggle()
  local window = require("core.window").setup()
end

function M:setup(opts)
  opts = opts or self:get_default_config()

  if opts.verbose then
    M.logger = require("utils.logger").init(debug.getinfo(1,'S').source)
  end

  local default_autocommands = require("static.autocmds")
  M:create_autocommands(default_autocommands)

  local default_keymaps = require("static.keymaps")
  M:set_keymaps(default_keymaps)
end

return M
