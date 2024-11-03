local window_segment = require("meowboard-nvim.window_segment")

local M = {}
M.__index = M

function M:get_title_segment_content()
  return {
    '                                                                                                                 ',
    '                                                                                                                 ',
    '                        __  __ ______ ______          ______   ____          _____  _____                        ',
    '                       |  \\/  |  ____/ __ \\ \\        / /  _ \\ / __ \\   /\\   |  __ \\|  __ \\               ',
    '                       | \\  / | |__ | |  | \\ \\  /\\  / /| |_) | |  | | /  \\  | |__) | |  | |                 ',
    '                       | |\\/| |  __|| |  | |\\ \\/  \\/ / |  _ <| |  | |/ /\\ \\ |  _  /| |  | |                ',
    '                       | |  | | |___| |__| | \\  /\\  /  | |_) | |__| / ____ \\| | \\ \\| |__| |                 ',
    '                       |_|  |_|______\\____/   \\/  \\/   |____/ \\____/_/    \\_\\_|  \\_\\_____/               ',
    '                                                                                                                 ',
    '                                                                                                                 ',
    '                                                                                                                 ',
  }
end

function M:get_logo_segment_content()
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

function M:new()
  local instance = setmetatable({}, M)

  instance.logo_segment = window_segment:new("logo", 20, 4, 38, 13)
  instance.logo_segment:set_content(self.get_logo_segment_content(self))

  return instance
end

function M:toggle()
  local logo_window_id = self.logo_segment:open()
  print(logo_window_id)
end

return M
