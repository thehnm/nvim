local on_attach = require("utils.lsp").on_attach

local config = function()
    require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local lspconfig = require("lspconfig")

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

    -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "json", "jsonc" },
    })

    -- python
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },
    })

    -- typescript
    lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "typescript",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    })

    -- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "javascript",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
            "vue",
        },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local flake8 = require("efmls-configs.linters.flake8")
    local black = require("efmls-configs.formatters.black")
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettierd = require("efmls-configs.formatters.prettier_d")
    local fixjson = require("efmls-configs.formatters.fixjson")

    -- configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "lua",
            "python",
            "typescript",
            "json",
            "jsonc",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                python = { flake8, black },
                typescript = { eslint_d, prettierd },
                json = { eslint_d, fixjson },
                jsonc = { eslint_d, fixjson },
                javascript = { eslint_d, prettierd },
                javascriptreact = { eslint_d, prettierd },
                typescriptreact = { eslint_d, prettierd },
                svelte = { eslint_d, prettierd },
                vue = { eslint_d, prettierd },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "folke/trouble.nvim",
    },
}
