vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
    desc = "Highlight yanked text",
})

-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = lsp_fmt_group,
--     callback = function()
--         local efm = vim.lsp.get_clients({ name = "efm" })
--         if vim.tbl_isempty(efm) then
--             return
--         end
--         vim.lsp.buf.format({ name = "efm", async = true })
--     end,
-- })

vim.api.nvim_create_autocmd("DiagnosticChanged", {
    pattern = "*",
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

vim.api.nvim_create_augroup("FileTypeSpecificSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "FileTypeSpecificSettings",
    pattern = "javascript,typescript,svelte,html,json",
    command = "setlocal shiftwidth=2 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
    group = "FileTypeSpecificSettings",
    pattern = "python",
    command = "setlocal shiftwidth=4 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
    group = "FileTypeSpecificSettings",
    pattern = "go",
    command = "setlocal shiftwidth=4 noexpandtab",
})
