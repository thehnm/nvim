return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({
            input_after_comment = false,
            languages = {
                python = {
                    template = {
                        annotation_convention = "numpydoc",
                    },
                },
            },
        })
    end,
    version = "*",
    lazy = false,
}
