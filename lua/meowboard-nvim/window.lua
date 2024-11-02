local M = {}
M.__index = M

M.margin_horizontal = 4
M.margin_vertical = 2
M.border = "rounded"
M.content = {
  "WOOF!",
  "...and MEOW!"
}

function M:new(width, height)
  local instance = setmetatable({}, M)

  instance.width = width - 2*self.margin_horizontal
  instance.height = height - 2*self.margin_vertical

  print(string.format("Width: %d, Height: %d", instance.width, instance.height))
  instance.position_row = self.margin_horizontal
  instance.position_col = self.margin_vertical

  instance.dashboard_buffer = vim.api.nvim_create_buf(false, true)

  return instance
end

function M:show()
  vim.api.nvim_buf_set_lines(self.dashboard_buffer, 0, -1, false, self.content)

  vim.api.nvim_open_win(
    self.dashboard_buffer, true, {
      relative='win',
      width=self.width,
      height=self.height,
      col=self.position_col, row=self.position_row,
      border = self.border,
      style = "minimal"
    })
end

return M
