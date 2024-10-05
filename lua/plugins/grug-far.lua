local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "MagicDuck/grug-far.nvim",
    lazy = false,
    config = function()
        require("grug-far").setup({})
        mapkeyret("<leader>gf", "lua require('grug-far').open({ transient = true })", "Open GrugFar transient buffer")
    end,
}
