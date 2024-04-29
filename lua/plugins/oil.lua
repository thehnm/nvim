local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
        })
    end,
    keys = {
        mapkeyret("-", "Oil", "Open Oil File Explorer"),
    },
}
