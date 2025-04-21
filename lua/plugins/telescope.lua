local mapkeyret = require("utils.mapkey").mapkeyret

local config = function()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = true,
                hidden = true,
            },
            live_grep = {
                theme = "dropdown",
                previewer = true,
            },
            buffers = {
                theme = "dropdown",
                previewer = true,
            },
        },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    branch = "0.1.x",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config,
    keys = {
        mapkeyret("<leader>fk", "Telescope keymaps", "Show keymaps"),
        mapkeyret("<leader>fh", "Telescope help_tags", "Show help tags"),
        mapkeyret("<leader>ff", "Telescope find_files", "Find file"),
        mapkeyret("<leader>fg", "Telescope live_grep", "Live grep"),
        mapkeyret("<leader>fb", "Telescope buffers", "Find buffer"),
        mapkeyret("<leader>fs", "Telescope lsp_document_symbols", "Show LSP symbols"),
    },
}
