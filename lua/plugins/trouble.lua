local mapkey = require("utils.mapkey").mapkey

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")
        mapkey("<leader>xx", trouble.toggle, "Toggle trouble")
        mapkey("<leader>xw", function()
            trouble.toggle("workspace_diagnostics")
        end, "Show workspace diagnostics")
        mapkey("<leader>xd", function()
            trouble.toggle("document_diagnostics")
        end, "Show document diagnostics")
        mapkey("<leader>xq", function()
            trouble.toggle("quickfix")
        end, "Show quickfix list")
        mapkey("<leader>xl", function()
            trouble.toggle("loclist")
        end, "Show window location list")
        mapkey("<leader>xr", function()
            trouble.toggle("lsp_references")
        end, "Show references of word under cursor")
    end,
}
