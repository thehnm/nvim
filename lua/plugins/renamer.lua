local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "filipdutescu/renamer.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("renamer").setup()
    end,
}
