local utils = require("meowboard-nvim.utils")
local Window = require("meowboard-nvim.window")

local M = {}

function M.toggle(win)
  vim.notify("toggle")
  local window = Window:new(win)

  window:show()
end

function M.setup(opts)
  local default_config = utils.get_default_config()
  local default_autocommands = utils.get_default_autocmds()
  local default_keymaps = utils.get_default_keymaps()

  opts = opts or default_config

  for _, autocommand in ipairs(default_autocommands) do
    utils.set_autocmd(autocommand)
  end

  for _, keymap in ipairs(default_keymaps) do
    utils.set_keymap(keymap)
  end
end

return M
