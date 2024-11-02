local M = {}
M.__index = M

M.margin_x = 20
M.margin_y = 4
M.border = "rounded"
M.content = {
  "WOOF!",
  "...and MEOW!"
}

function M:new(width, height)
  print(string.format("Original format: %d x %d", width, height))
  local instance = setmetatable({}, M)

  instance.width = width - 2*self.margin_x
  instance.height = height - 2*self.margin_y

  print(string.format("Margin format: %d x %d", instance.width, instance.height))
  instance.position_x = self.margin_x
  instance.position_y = self.margin_y

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
      col=self.position_x, row=self.position_y,
      border = self.border,
      style = "minimal"
    })
end

return M
