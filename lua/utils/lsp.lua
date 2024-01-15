local mapkeyret = require("utils.mapkey").mapkeyret

local M = {}

M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    mapkeyret("<leader>fd", "Lspsaga finder", "Go to definition", "n", opts)
    mapkeyret("<leader>gd", "Lspsaga peek_definition", "Peak definition", "n", opts)
    mapkeyret("<leader>gD", "Lspsaga goto_definition", "Go to definition", "n", opts)
    mapkeyret("<leader>ca", "Lspsaga code_action", "Show available code actions", "n", opts)
    mapkeyret("<leader>rn", "Lspsaga rename", "Smart rename", "n", opts)
    mapkeyret("<leader>D", "Lspsaga show_line_diagnostics", "Show diagnostics for line", "n", opts)
    mapkeyret("<leader>d", "Lspsaga show_cursor_diagnostics", "Show diagnostics for cursor", "n", opts)
    mapkeyret("<leader>pd", "Lspsaga diagnostic_jump_prev", "Jump to prev diagnostic in buffer", "n", opts)
    mapkeyret("<leader>nd", "Lspsaga diagnostic_jump_next", "Jump to next diagnostic in buffer", "n", opts)
    mapkeyret("K", "Lspsaga hover_doc", "Show documentation for what is under cursor", "n", opts)

    if client.name == "pyright" then
        mapkeyret("<Leader>oi", "PyrightOrganizeImports", "Organize imports", "n", opts)
    end
end

return M
