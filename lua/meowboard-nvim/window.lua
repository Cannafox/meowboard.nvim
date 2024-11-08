local window_segment = require("meowboard-nvim.window_segment")

local M = {}
local M_mt = { __index = M }

function M:new()
  return setmetatable({
    logo_segment = window_segment:new({
      name = "logo",
      x = 20, y = 4,
      width = 38, height = 13,
      content = self.get_logo_segment_content()
    }),
    explorer_segment = window_segment:new({
      name = "explorer",
      x = 20, y = (4+13)+10,
      width = 38, height = 23,
      content = {"TEST"}
    }),
    title_segment = window_segment:new({
      name = "title",
      x = (20+38)+5, y = 4,
      width = 89, height = 11,
      content = self.get_title_segment_content()
    }),
    info_segment = window_segment:new({
      name = "info",
      x = (20+38)+5, y = 17,
      width = 89, height = 2,
      content = {"TEST"}
    }),
  }, M_mt)
end

function M:toggle()
  self.logo_segment:open()
  self.explorer_segment:open()
  self.title_segment:open()
  self.info_segment:open()
end

function M.get_title_segment_content()
  return {
    '                                                                                         ',
    '                                                                                         ',
    '        __  __ ______ ______          ______   ____          _____  _____                ',
    '       |  \\/  |  ____/ __ \\ \\        / /  _ \\ / __ \\   /\\   |  __ \\|  __ \\       ',
    '       | \\  / | |__ | |  | \\ \\  /\\  / /| |_) | |  | | /  \\  | |__) | |  | |         ',
    '       | |\\/| |  __|| |  | |\\ \\/  \\/ / |  _ <| |  | |/ /\\ \\ |  _  /| |  | |        ',
    '       | |  | | |___| |__| | \\  /\\  /  | |_) | |__| / ____ \\| | \\ \\| |__| |         ',
    '       |_|  |_|______\\____/   \\/  \\/   |____/ \\____/_/    \\_\\_|  \\_\\_____/       ',
    '                                                                                         ',
    '                                                                                         ',
    '                                                                                         ',
  }
end

function M.get_logo_segment_content()
  return {
    '                                     ',
    '             ／＞-- フ               ',
    '            | 　_　_|  miau.         ',
    '          ／` ミ＿xノ                ',
    '        /　 　　 |                   ',
    '       /　  ヽ　|                    ',
    '       │　　 | ||   MIAU   ╱|、      ',
    '   ／￣|　　 | ||        (˚ˎ 。7     ',
    '  ( ￣ ヽ＿_ヽ_)__)       |、˜ |     ',
    '   ＼二)                  じしˍ,)ノ  ',
    '                                     ',
  }
end

return M
