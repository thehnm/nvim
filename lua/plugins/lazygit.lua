local mapkeyret = require("utils.mapkey").mapkeyret

return {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        mapkeyret("<leader>gg", "LazyGit", "Open LazyGit"),
    },
}
