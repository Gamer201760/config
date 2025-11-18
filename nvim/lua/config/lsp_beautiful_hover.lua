vim.diagnostic.config({
    virtual_text  = false,
    virtual_lines = { current_line = true }, -- только для текущей строки
    signs         = true,
    underline     = true,
})

vim.keymap.set("n", "<Leader>gk", function()
    local cur = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = not cur })
end, { desc = "Toggle virtual lines" })
