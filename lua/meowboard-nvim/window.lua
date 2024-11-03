local window_segment = require("meowboard-nvim.window_segment")

local M = {}
local M_mt = { __index = M }

function M:new()
  return setmetatable({
    logo_segment = window_segment:new("logo", 20, 4, 38, 13, self.get_logo_segment_content()),
    title_segment = window_segment:new("title", (20+38)+2, 4, 113 - 120, 13, self.get_title_segment_content()),
  }, M_mt)
end

function M:toggle()
  self.logo_segment:open()
end

function M.get_title_segment_content()
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
