local M = {}
M.__index = M

M.win_opts = {
}
M.border = "rounded"
M.content = {
  "WOOF!",
  "...and MEOW!"
}

function M:get_dummy_content()
  return {
    '                                    ║                                                                                                                 ',
    '             ／＞-- フ              ║                                                                                                                 ',
    '            | 　_　_|  miau.        ║                        __  __ ______ ______          ______   ____          _____  _____                        ',
    '          ／` ミ＿xノ               ║                       |  \\/  |  ____/ __ \\ \\        / /  _ \\ / __ \\   /\\   |  __ \\|  __ \\                       ',
    '        /　 　　 |                  ║                       | \\  / | |__ | |  | \\ \\  /\\  / /| |_) | |  | | /  \\  | |__) | |  | |                      ',
    '       /　  ヽ　|                   ║                       | |\\/| |  __|| |  | |\\ \\/  \\/ / |  _ <| |  | |/ /\\ \\ |  _  /| |  | |                      ',
    '       │　　 | ||   MIAU   ╱|、     ║                       | |  | | |___| |__| | \\  /\\  /  | |_) | |__| / ____ \\| | \\ \\| |__| |                      ',
    '   ／￣|　　 | ||        (˚ˎ 。7    ║                       |_|  |_|______\\____/   \\/  \\/   |____/ \\____/_/    \\_\\_|  \\_\\_____/                       ',
    '  ( ￣ ヽ＿_ヽ_)__)       |、˜ |    ║                                                                                                                 ',
    '   ＼二)                  じしˍ,)ノ ║                                                                                                                 ',
    '                                    ║                                                                                                                 ',
    '════════════════════════════════════╬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
    '                                    │                                                                                                                 ',
  }
end

function M:get_default_win_opts()
  return {
    relative='editor',
    border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
    style = "minimal",
    anchor = "NW",
  }
end

function M:new(width, height)
  local instance = setmetatable({}, M)

  instance.width =  150
  instance.height = 35

  instance.position_x = 20
  instance.position_y = 4

  instance.dashboard_buffer = vim.api.nvim_create_buf(false, true)
  instance.content = self.get_dummy_content(self)

  return instance
end

function M:show()
  vim.api.nvim_buf_set_lines(self.dashboard_buffer, 0, -1, false, self.content)

  vim.api.nvim_open_win(
    self.dashboard_buffer,
    true,
    vim.tbl_deep_extend('force', self.get_default_win_opts(self), {
      width=self.width,
      height=self.height,
      col=self.position_x,
      row=self.position_y,
    })
  )
end

return M
