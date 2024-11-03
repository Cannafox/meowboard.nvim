local M = {}
local M_mt = { __index = M }

function M:new(opts)
  return setmetatable({
    win = nil,
    name = opts.name,
    x = opts.x,
    y = opts.y,
    width = opts.width,
    height = opts.height,
    content = opts.content,
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
  vim.api.nvim_buf_set_lines(self.buffer, 0, -1, false, self.content)

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
end

-- function M:clear()
--   vim.api.nvim_win_close()
--   print("pass")
-- end

return M
