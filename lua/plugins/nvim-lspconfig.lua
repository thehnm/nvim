local on_attach = require("utils.lsp").on_attach

local config = function()
    require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- lua
    vim.lsp.config("lua_ls", {
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
    vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "json", "jsonc" },
    })

    -- python
    vim.lsp.config("pyright", {
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
    vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
    })

    vim.lsp.config("svelte", {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
            "svelte",
        },
    })

    -- html, javascriptreact, css, sass, scss, less, vue
    vim.lsp.config("emmet_ls", {
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
    vim.lsp.config("texlab", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "tex",
            "plaintex",
            "bib",
        },
    })

    -- go
    vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "go",
            "gomod",
        },
    })

    -- bash
    vim.lsp.config("bashls", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "sh",
            "bash",
        },
    })

    -- c/c++
    vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "c",
            "cpp",
        },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local flake8 = require("efmls-configs.linters.flake8")
    local black = require("efmls-configs.formatters.black")
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local cpplint = require("efmls-configs.linters.cpplint")

    local prettierd = require("efmls-configs.formatters.prettier_d")
    local fs = require("efmls-configs.fs")
    prettierd.formatCommand = string.format(
        "%s --stdin-filepath '${INPUT}' ${--range-start=charStart} ${--range-end=charEnd}",
        fs.executable("prettierd", fs.Scope.NODE)
    )

    local gofmt = require("efmls-configs.formatters.gofmt")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local beautysh = require("efmls-configs.formatters.beautysh")
    local sqlfluff = require("efmls-configs.linters.sqlfluff")
    local sql_formatter = require("efmls-configs.formatters.sql-formatter")
    local clang_format = require("efmls-configs.formatters.clang_format")

    -- configure efm server
    vim.lsp.config("efm", {
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
            "yaml",
            "sql",
            "c",
            "cpp",
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
                go = { nil, gofmt },
                css = { eslint_d, prettierd },
                sh = { shellcheck, beautysh },
                yaml = { nil, prettierd },
                sql = { sqlfluff, sql_formatter },
                c = { cpplint, clang_format },
                cpp = { cpplint, clang_format },
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
