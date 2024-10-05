local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "folke/trouble.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    config = function()
        require("trouble").setup()
        mapkeyret("<leader>xx", "Trouble diagnostics toggle focus=true", "Diagnostics (Trouble)")
        mapkeyret("<leader>xw", "Trouble symbols toggle focus=true", "Symbols (Trouble)")
        mapkeyret("<leader>xd", "Trouble diagnostics toggle filter.buf=0 focus=true", "Buffer Diagnostics (Trouble)")
        mapkeyret("<leader>xq", "Trouble qflist toggle focus=true", "Quickfix List (Trouble)")
        mapkeyret("<leader>xl", "Trouble loclist toggle focus=true", "Location List (Trouble)")
        mapkeyret("<leader>xr", "Trouble lsp toggle focus=true", "LSP Definitions / references / ... (Trouble)")
    end,
}
