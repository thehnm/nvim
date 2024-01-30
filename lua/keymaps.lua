local mapkeyret = require("utils.mapkey").mapkeyret
local ExecuteShellCommandInBuffer = require("usercmd").ExecuteShellCommandInBuffer

vim.api.nvim_create_user_command("RunShellCommand", ExecuteShellCommandInBuffer, {})
mapkeyret("<leader>e", "RunShellCommand", "Run shell command")

mapkeyret("<leader>sn", "bnext", "Switch to next buffer")
mapkeyret("<leader>sp", "bprevious", "Switch to previous buffer")
vim.api.nvim_set_keymap("t", "<C-e>", [[<C-\><C-n>]], { noremap = true })
