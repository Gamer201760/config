require('mason').setup()
require('mason-lspconfig').setup()


-- See: https://github.com/neovim/nvim-lspconfig/tree/54eb2a070a4f389b1be0f98070f81d23e2b1a715#suggested-configuration
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers {
    function(server_name) -- default handler (optional)
        if server_name == 'ruff' or server_name == 'ruff_lsp' or server_name == 'pyright' then
            do return end
        end
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end
}

require('conform').setup({
    formatters_by_ft = {
        python = {
            'ruff_fix',
            'ruff_format',
        },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
    },
})

local util = require('vim.lsp.util')
-- The function that replace those quirky html symbols.
local function split_lines(value)
    value = string.gsub(value, '&nbsp;', ' ')
    value = string.gsub(value, '&gt;', '>')
    value = string.gsub(value, '&lt;', '<')
    value = string.gsub(value, '\\', '')
    value = string.gsub(value, '```python', '')
    value = string.gsub(value, '```', '')
    return vim.split(value, '\n', { plain = true, trimempty = true })
end

-- The function name is the same as what you found in the neovim repo.
-- I just remove those unused codes.
-- Actually, this function doesn't 'convert input to markdown'.
-- I just keep the function name the same for reference.
local function convert_input_to_markdown_lines(input, contents)
    contents = contents or {}
    assert(type(input) == 'table', 'Expected a table for LSP input')
    if input.kind then
        local value = input.value or ''
        vim.list_extend(contents, split_lines(value))
    end
    if (contents[1] == '' or contents[1] == nil) and #contents == 1 then
        return {}
    end
    return contents
end

local function hover(_, result, ctx, config)
    config = config or {}
    config.focus_id = ctx.method
    if vim.api.nvim_get_current_buf() ~= ctx.bufnr then
        -- Ignore result since buffer changed. This happens for slow language servers.
        return
    end
    if not (result and result.contents) then
        if config.silent ~= true then
            vim.notify('No information available')
        end
        return
    end
    local contents ---@type string[]
    contents = convert_input_to_markdown_lines(result.contents)
    if vim.tbl_isempty(contents) then
        if config.silent ~= true then
            vim.notify('No information available')
        end
        return
    end
    -- Notice here. The 'plaintext' string was originally 'markdown'.
    -- The reason of using 'plaintext' instead of 'markdown' is becasue
    -- of the bracket characters ([]). Markdown will hide single bracket,
    -- so when your docstrings consist of numpy or pytorch or python list,
    -- you will get garbadge hover results.
    -- The bad side of 'plaintext' is that you never get syntax highlighting.
    -- I personally don't care about this.
    return util.open_floating_preview(contents, 'plaintext', config)
end

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = {
        ['textDocument/hover'] = vim.lsp.with(hover, {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            -- title = ' |･ω･) ? ',
            max_width = 120,
            zindex = 500,
        }),
    },
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticSeverityOverrides = {
                    -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                    reportUndefinedVariable = "none",
                },
                diagnosticMode = "workspace",
            },
        },
    },
}

lspconfig.ruff.setup {}
