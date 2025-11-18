return {
    { 'echasnovski/mini.nvim',          version = false },
    { "mason-org/mason.nvim",           opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {},      dependencies = { "neovim/nvim-lspconfig" } },
    { "neovim/nvim-lspconfig" },

    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts_extend = { "sources.default" }
    },
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
