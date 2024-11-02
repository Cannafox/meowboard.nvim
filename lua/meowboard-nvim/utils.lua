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

function M.set_autocmd(autocmd)
  vim.api.nvim_create_user_command(autocmd[1], autocmd[2], autocmd[3])
end

function M.set_keymap(keymap)
  vim.keymap.set(keymap[1], keymap[2], keymap[3])
end

return M
