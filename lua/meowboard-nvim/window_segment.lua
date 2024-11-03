local M = {}
local M_mt = { __index = M }

function M:new(name, x, y, width, height, content)
  return setmetatable({
    win = nil,
    name = name,
    x = x,
    y = y,
    width = width,
    height = height,
    content = content,
    defaults = {
      relative = "editor",
      border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
      style = "minimal",
      anchor = "NW",
    },
    buffer = vim.api.nvim_create_buf(false, true),
  }, M_mt)
end

function M:open()
  self.win = vim.api.nvim_open_win(
    self.buffer,
    true,
    vim.tbl_deep_extend('force', self.defaults, {
      width=self.width,
      height=self.height,
      col=self.x,
      row=self.y,
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
