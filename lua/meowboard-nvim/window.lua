local M = {}
M.__index = M

function M:new(window)
  local instance = setmetatable({}, M)

  instance.width = vim.api.nvim_win_get_width(window) or 10
  instance.height = vim.api.nvim_win_get_height(window) or 10
  instance.border = "rounded"

  return instance
end

function M:show()
  vim.api.nvim_open_win(
    vim.api.nvim_get_current_buf(), true, {
      relative='win',
      width=self.width,
      height=self.height,
      col=0, row=0,
      border = self.border
    })
end

return M
