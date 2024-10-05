local M = {}

function M.ExecuteShellCommandInBuffer()
    local cmd = vim.fn.input("Enter: ")
    if cmd == "" then
        return
    end

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = bufnr })
    vim.api.nvim_set_option_value("bufhidden", "hide", { buf = bufnr })
    vim.api.nvim_set_option_value("swapfile", false, { buf = bufnr })
    vim.api.nvim_set_option_value("modifiable", true, { buf = bufnr })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":bd!<CR>", { noremap = true, silent = true })

    vim.cmd("split")

    vim.api.nvim_win_set_buf(0, bufnr)

    local function onread(err, data)
        if err then
            print("Error:", err)
        elseif data then
            vim.schedule(function()
                data = data:gsub("^%s+", ""):gsub("%s+$", "")
                if #data > 0 then
                    local lines = vim.split(data, "\n")
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, lines)
                end
            end)
        end
    end

    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local handle
    handle = vim.loop.spawn("sh", {
        args = { "-c", cmd },
        stdio = { nil, stdout, stderr },
    }, function(code, signal)
        stdout:read_stop()
        stderr:read_stop()
        stdout:close()
        stderr:close()
        handle:close()
        vim.schedule(function()
            vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
        end)
    end)

    vim.loop.read_start(stdout, onread)
    vim.loop.read_start(stderr, onread)
end

function M.DiagnosticsStatus()
    local diagnostics = vim.diagnostic.get(0)
    local errors = 0
    local warnings = 0
    local infos = 0
    local hints = 0
    for _, diag in pairs(diagnostics) do
        if diag.severity == vim.diagnostic.severity.ERROR then
            errors = errors + 1
        elseif diag.severity == vim.diagnostic.severity.WARN then
            warnings = warnings + 1
        elseif diag.severity == vim.diagnostic.severity.INFO then
            infos = infos + 1
        elseif diag.severity == vim.diagnostic.severity.HINT then
            hints = hints + 1
        end
    end
    if errors == 0 and warnings == 0 and infos == 0 and hints == 0 then
        return ""
    else
        local non_zero_strings = {}
        if errors ~= 0 then
            table.insert(non_zero_strings, string.format("E:%d", errors))
        end
        if warnings ~= 0 then
            table.insert(non_zero_strings, string.format("W:%d", warnings))
        end
        if infos ~= 0 then
            table.insert(non_zero_strings, string.format("I:%d", infos))
        end
        if hints ~= 0 then
            table.insert(non_zero_strings, string.format("H:%d", hints))
        end
        return table.concat(non_zero_strings, " ")
    end
end

return M
