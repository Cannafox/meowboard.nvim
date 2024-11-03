local M = {}
M.__index = M

function M:new(name, x, y, width, height)
  local instance = setmetatable({}, M)

  instance.name = name
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.content = ""

  instance.buffer = vim.api.nvim_create_buf(false, true)

  return instance
end

function M:get_default_win_opts()
  return {
    relative='editor',
    border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
    style = "minimal",
    anchor = "NW",
  }
end

function M:open()
  local win = vim.api.nvim_open_win(
    self.buffer,
    true,
    vim.tbl_deep_extend('force', self.get_default_win_opts(self), {
      width=self.width,
      height=self.height,
      col=self.position_x,
      row=self.position_y,
    })
  )

  return win
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
