local M = {}
M.__index = M

function M:new(name, x, y, width, height)
  local instance = setmetatable({}, M)

  instance.win = nil
  instance.name = name
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.content = ""
  instance.defaults = {
    relative='editor',
    border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
    style = "minimal",
    anchor = "NW",
  }
  instance.buffer = vim.api.nvim_create_buf(false, true)

  return instance
end

function M:open()
  self.win = vim.api.nvim_open_win(
    self.buffer,
    true,
    vim.tbl_deep_extend('force', self.defaults, {
      width=self.width,
      height=self.height,
      col=self.position_x,
      row=self.position_y,
    })
  )
end

function M:set_content(content)
  self.content = content

  vim.api.nvim_buf_set_lines(self.buffer, 0, -1, false, content)
end

-- function M:clear()
--   vim.api.nvim_win_close()
--   print("pass")
-- end

return M
