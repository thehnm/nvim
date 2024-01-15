return {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 999,
    config = function()
        vim.g.nord_italic = false
        vim.g.nord_uniform_diff_background = true
        vim.cmd("colorscheme nord")
    end,
}
