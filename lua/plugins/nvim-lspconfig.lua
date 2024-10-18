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
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
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
    lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    })

    lspconfig.svelte.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "svelte",
        },
    })

    -- html, javascriptreact, css, sass, scss, less, vue
    lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "html",
            "css",
            "sass",
            "scss",
            "less",
            "vue",
        },
    })

    -- latex
    lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "tex",
            "plaintex",
            "bib",
        },
    })

    -- go
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "go",
            "gomod",
        },
    })

    -- bash
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "sh",
            "bash",
        },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local flake8 = require("efmls-configs.linters.flake8")
    local black = require("efmls-configs.formatters.black")
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettierd = require("efmls-configs.formatters.prettier_d")
    local golangcilint = require("efmls-configs.linters.golangci_lint")
    local goimports = require("efmls-configs.formatters.goimports")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local beautysh = require("efmls-configs.formatters.beautysh")

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
            "markdown",
            "html",
            "go",
            "css",
            "sh",
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
                json = { eslint_d, prettierd },
                jsonc = { eslint_d, prettierd },
                javascript = { eslint_d, prettierd },
                javascriptreact = { eslint_d, prettierd },
                typescriptreact = { eslint_d, prettierd },
                svelte = { eslint_d, prettierd },
                vue = { eslint_d, prettierd },
                markdown = { prettierd, nil },
                html = { nil, prettierd },
                go = { golangcilint, goimports },
                css = { eslint_d, prettierd },
                sh = { shellcheck, beautysh },
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
        "filipdutescu/renamer.nvim",
    },
}
