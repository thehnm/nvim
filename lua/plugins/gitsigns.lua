local mapkey = require("utils.mapkey").mapkey

return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
        require("gitsigns").setup({
            numhl = true,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local opts = { buffer = bufnr }

                mapkey("<leader>hs", gs.stage_hunk, "Stage current hunk", "n", opts)
                mapkey("<leader>hr", gs.reset_hunk, "Reset current hunk", "n", opts)
                mapkey("<leader>hs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Stage hunk in visual selection", "v", opts)
                mapkey("<leader>hr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Reset hunk in visual selection", "v", opts)
                mapkey("<leader>hS", gs.stage_buffer, "Stage all hunks in buffer", "n", opts)
                mapkey("<leader>hu", gs.undo_stage_hunk, "Undo stage hunk", "n", opts)
                mapkey("<leader>hR", gs.reset_buffer, "Reset all hunks in buffer", "n", opts)
                mapkey("<leader>hp", gs.preview_hunk, "Preview hunk", "n", opts)
                mapkey("<leader>hb", function()
                    gs.blame_line({ full = true })
                end, "Git blame on the current line", "n", opts)
                mapkey("<leader>tb", gs.toggle_current_line_blame, "Toggle git blames", "n", opts)
                mapkey("<leader>hd", gs.diffthis, "Show diff against index", "n", opts)
                mapkey("<leader>hD", function()
                    gs.diffthis("~")
                end, "Show diff", "n", opts)
                mapkey("<leader>td", gs.toggle_deleted, "Toggle git deleted", "n", opts)
            end,
        })
    end,
}
