local default_opts = { noremap = false, silent = true }

local M = {}

--- @param keymap string String
--- @param cmd (string|function)
--- @param desc (string|nil)
--- @param mode (string|nil)
--- @param opts (table|nil)
--- @return nil
function M.mapkey(keymap, cmd, desc, mode, opts)
    opts = opts or default_opts
    if desc ~= nil then
        opts.desc = desc
    end
    vim.keymap.set(mode or "n", keymap, cmd, opts)
end

--- @param keymap string String
--- @param cmd string String
--- @param desc (string|nil)
--- @param mode (string|nil)
--- @param opts (table|nil)
--- @return nil
function M.mapkeyret(keymap, cmd, desc, mode, opts)
    opts = opts or default_opts
    if desc ~= nil then
        opts.desc = desc
    end
    vim.keymap.set(mode or "n", keymap, [[<cmd>]] .. cmd .. [[<CR>]], opts)
end

return M
