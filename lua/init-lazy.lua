local opts = {
    defaults = {
        lazy = true,
    },
    install = {
        missing = true,
        colorscheme = { "nord" },
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrw",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
    change_detection = {
        notify = false,
    },
}

require("lazy").setup("plugins", opts)
