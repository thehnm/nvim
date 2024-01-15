local M = {}

function M.ExecuteShellCommandInBuffer()
    local command = vim.fn.input("Enter: ")
    if command == "" then
        return
    end

    local command_with_stderr = command .. " 2>&1"
    local handle = io.popen(command_with_stderr, "r")
    if handle == nil then
        print("Failed to execute command")
        return
    end
    local command_output = handle:read("*a")
    handle:close()

    vim.api.nvim_command("new")

    vim.api.nvim_buf_set_name(0, "Shell Command Output")

    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(command_output, "\n"))

    vim.api.nvim_buf_set_option(0, "buftype", "nofile")
    vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(0, "swapfile", false)

    vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })

    vim.cmd('echo ""')
    vim.cmd("redraw")
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
        return string.format("E:%d W:%d I:%d H:%d", errors, warnings, infos, hints)
    end
end

return M
