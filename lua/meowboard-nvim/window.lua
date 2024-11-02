local M = {}
M.__index = M

M.margin = 2

function M:new(window)
  local instance = setmetatable({}, M)

  instance.width = vim.api.nvim_win_get_width(window) - 4*self.margin
  instance.height = vim.api.nvim_win_get_height(window) - 2*self.margin
  print(string.format("Width: %d, Height: %d", instance.width, instance.height))
  instance.position_row = self.margin / 2
  instance.position_col = self.margin

  instance.border = "rounded"

  return instance
end

function M:show()
  vim.api.nvim_open_win(
    vim.api.nvim_get_current_buf(), true, {
      relative='win',
      width=self.width,
      height=self.height,
      col=self.position_col, row=self.position_row,
      border = self.border
    })
end

return M
