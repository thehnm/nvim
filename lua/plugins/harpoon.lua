local mapkey = require("utils.mapkey").mapkey

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    lazy = false,
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        mapkey("<leader>a", function()
            harpoon:list():add()
        end)
        mapkey("<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        mapkey("<M-S-P>", function()
            harpoon:list():prev()
        end)
        mapkey("<M-S-N>", function()
            harpoon:list():next()
        end)
    end,
}
