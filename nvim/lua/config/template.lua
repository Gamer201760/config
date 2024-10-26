function Insert_template_from_file(filepath)
    local file = io.open(filepath, "r")
    if file then
        local template = file:read("*a")
        file:close()
        vim.api.nvim_put(vim.split(template, "\n"), "l", true, true)
    else
        print("ERROR: File err")
    end
end
