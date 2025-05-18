local opts = {
    ensure_installed = {
        "efm",
        "ts_ls",
        "tailwindcss",
        "pyright",
        "lua_ls",
        "emmet_ls",
        "jsonls",
        "gopls",
    },
    automatic_installation = true,
    automatic_enable = false,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
