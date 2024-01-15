local mapkey = require("utils.mapkey").mapkey

return {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({
            disable_context_highlighting = false,
        })
        mapkey("<leader>gg", neogit.open, "Open neogit")
    end,
}
