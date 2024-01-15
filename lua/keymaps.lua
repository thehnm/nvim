local mapkeyret = require("utils.mapkey").mapkeyret
local ExecuteShellCommandInBuffer = require("usercmd").ExecuteShellCommandInBuffer

mapkeyret("<leader>bf", "NvimTreeFocus", "Focus on filetree")
mapkeyret("<leader>bt", "NvimTreeToggle", "Toggle filetree")

vim.api.nvim_create_user_command("RunShellCommand", ExecuteShellCommandInBuffer, {})
mapkeyret("<leader>e", "RunShellCommand", "Run shell command")
