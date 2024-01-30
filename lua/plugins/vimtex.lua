local pdf_viewer = "zathura"

return {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
        vim.g.vimtex_view_general_viewer = pdf_viewer
        vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
        vim.g.vimtex_compiler_latexmk = {
            backend = "nvim",
            background = 1,
            build_dir = "build",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-outdir=build",
                "-xelatex",
            },
        }
    end,
}
