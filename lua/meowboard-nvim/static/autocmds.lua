local meowboard = require("meowboard-nvim")

return {
  { "MeowboardToggle", function() meowboard.toggle(vim.api.nvim_get_current_win()) end, { desc = { "test" } } }
}
