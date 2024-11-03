local meowboard = require("meowboard-nvim")

return {
  { "MeowboardToggle", function() meowboard.toggle() end, { desc = { "test" } } }
}
