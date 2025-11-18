require("mason").setup({})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls", "rust_analyzer", "pyright", "ts_ls", "ruff" },
    automatic_enable = true,
})


local blink = require("blink.cmp")

blink.setup({
    keymap = {
        preset = "none", -- отключить дефолтные бинды

        ["<C-Space>"] = { 'show', 'show_documentation', 'hide_documentation' },

        ["<C-e>"] = { "hide", 'fallback' },

        ["<CR>"] = { "accept", 'fallback' },
        ["<M-e>"] = { "cancel", 'fallback' },

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = true },
        menu = {
            draw = {
                columns = { { "kind_icon", "label", gap = 1 }, { "label_description", "kind" } },
                treesitter = { 'lsp' }
            },
        },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
})


local hover_opts = {
    border = "rounded",                                     -- стиль рамки[web:5]
    max_width = math.floor(vim.o.columns * 0.45),           -- ширина не более ~45% экрана[web:7]
    max_height = math.floor(vim.o.lines * 0.35),            -- высота не более ~35% экрана[web:7]
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder", -- управление цветами[web:5]
}
local on_attach = function(_, bufnr)
    local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
    end
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'K', function() vim.lsp.buf.hover(hover_opts) end)
    map('n', 'gi', vim.lsp.buf.implementation)
    map('n', '<Leader>rn', vim.lsp.buf.rename)
    map('n', '<Leader>ca', vim.lsp.buf.code_action)
end

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
            },
        },
    },
    gopls = {},
    rust_analyzer = {},
    pyright = {},
    ts_ls = {},
    ruff = {
        init_options = {
            settings = {
                args = {}, -- пример: { "--select", "E,F,I", "--unsafe-fixes" }
            },
        },
    },
}

for name, cfg in pairs(servers) do
    local base = {
        on_attach    = on_attach,
        settings     = cfg.settings,
        init_options = cfg.init_options,
        flags        = { debounce_text_changes = 150 },
    }
    vim.lsp.config(name, blink.get_lsp_capabilities(base))
    vim.lsp.enable(name)
end
