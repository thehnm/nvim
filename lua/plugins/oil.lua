local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    keys = {
        mapkeyret("-", "Oil", "Open Oil File Explorer"),
    },
}
