local utils = require("lua.meowboard-nvim.utils")

local M = {}

function M.setup(opts)
  local default_config = utils.get_default_config()
  local default_autocommands = utils.get_default_autocmds()
  local default_keymaps = utils.get_default_keymaps()

  opts = opts or default_config

  for _, autocommand in ipairs(default_autocommands) do
    vim.api.nvim_create_user_command(autocommand[1], autocommand[2], autocommand[3])
  end

  for _, keymap in ipairs(default_keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
  end
end

return M
