local M = {}

function M.get_default_config()
  return require("meowboard-nvim.static.defaults")
end

function M.get_default_keymaps()
  return require("meowboard-nvim.static.keymaps")
end

function M.get_default_autocmds()
  return require("meowboard-nvim.static.autocmds")
end

return M
