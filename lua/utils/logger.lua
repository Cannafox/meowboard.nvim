---Logging module
--@module logger
local M = {}

---Initialize logger module
--@function [parent=#geometry] init
--@param #string name
--@return nil
function M.init(name)
  M.name = name

  M.info("Initialized!")
end

---Print line
--@function [parent=#geometry] print
--@param #string line
--@return nil
function M.info(line)
  local result = string.format(
    "[%s] %s",
    M.name, line
  )
  vim.notify(result)
end

return M
