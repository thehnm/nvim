return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 999,
    config = function()
        require("rose-pine").setup({
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
            highlight_groups = {
                Comment = { italic = true },
            },
        })
    end,
    init = function()
        vim.cmd("colorscheme rose-pine")
    end,
}
