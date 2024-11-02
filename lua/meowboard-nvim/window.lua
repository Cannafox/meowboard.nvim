local M = {}
M.__index = M

function M:new(width, height)
  local instance = setmetatable({}, M)

  instance.width = width or 100
  instance.height = height or 100
  instance.border = "rounded"

  return instance
end

function M:show()
  vim.api.nvim_open_win(vim.api.nvim_get_current_buf(), true, {relative='win', width=self.width, height=self.height, col=0, row=0})
end

return M
