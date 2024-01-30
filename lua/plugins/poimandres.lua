return {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 999,
    config = function()
        require("poimandres").setup()
        vim.g.nord_italic = false
        vim.g.nord_uniform_diff_background = true
    end,
    init = function()
        vim.cmd("colorscheme poimandres")
    end,
}
