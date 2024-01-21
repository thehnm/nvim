local mapkeyret = require("utils.mapkey").mapkeyret
local ExecuteShellCommandInBuffer = require("usercmd").ExecuteShellCommandInBuffer

vim.api.nvim_create_user_command("RunShellCommand", ExecuteShellCommandInBuffer, {})
mapkeyret("<leader>e", "RunShellCommand", "Run shell command")
