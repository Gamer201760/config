return {
    { 'echasnovski/mini.nvim',          version = false },
    { "mason-org/mason.nvim",           opts = {} },                                                  -- базовая настройка Mason [web:6]
    { "mason-org/mason-lspconfig.nvim", opts = {},      dependencies = { "neovim/nvim-lspconfig" } }, -- авто-enable серверов [web:6]
    { "neovim/nvim-lspconfig" },                                                                      -- базовый LSP клиент [web:6]

    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up", -- if you want to start COQ at startup
                -- Your COQ settings here
            }
        end,
    }, -- основной плагин [web:1]
    { "ms-jpq/coq.artifacts",        branch = "artifacts" },
    { 'mg979/vim-visual-multi' },
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui",        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { "stevearc/conform.nvim",       opts = {} },
    { 'mfussenegger/nvim-dap-python' },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself
    },
    { "julianolf/nvim-dap-lldb" },
}
