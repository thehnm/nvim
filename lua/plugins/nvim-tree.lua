return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
            },
            view = {
                adaptive_size = true,
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "m",
                            staged = "a",
                            unmerged = "u",
                            renamed = "r",
                            untracked = "n",
                            deleted = "d",
                            ignored = "i",
                        },
                    },
                },
            },
        })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
