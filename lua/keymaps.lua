local mapkeyret = require("utils.mapkey").mapkeyret
local mapkey = require("utils.mapkey").mapkey
local ExecuteShellCommandInBuffer = require("usercmd").ExecuteShellCommandInBuffer

vim.api.nvim_create_user_command("RunShellCommand", ExecuteShellCommandInBuffer, {})
mapkeyret("<leader>e", "RunShellCommand", "Run shell command")

mapkeyret("<leader>sn", "bnext", "Switch to next buffer")
mapkeyret("<leader>sp", "bprevious", "Switch to previous buffer")
vim.api.nvim_set_keymap("t", "<C-e>", [[<C-\><C-n>]], { noremap = true })

local formatBuffer = function()
    local efm = vim.lsp.get_clients({ name = "efm" })
    if vim.tbl_isempty(efm) then
        return
    end
    vim.lsp.buf.format({ name = "efm", async = true })
end
mapkey("<leader>fw", formatBuffer, "Format current buffer")
