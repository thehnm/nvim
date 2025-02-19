local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = false,
    config = function()
        require("no-neck-pain").setup({
            width = 180,
        })
    end,
    keys = {
        mapkeyret("<leader>np", "NoNeckPain", "Toggles the No Neck Pain plugin"),
    },
}
