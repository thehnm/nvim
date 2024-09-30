local opts = {
    ensure_installed = {
        "efm",
        "tsserver",
        "tailwindcss",
        "pyright",
        "lua_ls",
        "emmet_ls",
        "jsonls",
        "gopls",
    },
    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
