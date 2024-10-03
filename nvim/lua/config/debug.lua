local cfg = {
    configurations = {
        cpp = {
            {
                name = "Launch debugger",
                type = "lldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                program = function()
                    -- Build with debug symbols
                    local out = vim.fn.system({ "make", "debug" })
                    -- Check for errors
                    if vim.v.shell_error ~= 0 then
                        vim.notify(out, vim.log.levels.ERROR)
                        return nil
                    end
                    -- Return path to the debuggable program
                    return "path/to/executable"
                end,
            },
        },
    },
}


require("dap-lldb").setup(cfg)
require("dap-python").setup("~/venv/bin/python")
require('dapui').setup({
    layouts = { {
        elements = { {
            id = "scopes",
            size = 1
        }, },
        position = "left",
        size = 50
    }, {
        elements = { {
            id = "repl",
            size = 1
        }, },
        position = "bottom",
        size = 10
    } }
}
)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dapui').toggle() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
