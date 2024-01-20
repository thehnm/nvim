local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        require("todo-comments").setup()
        mapkeyret("<leader>tt", ":TodoTelescope", "Show TODOs in project")
    end,
}
