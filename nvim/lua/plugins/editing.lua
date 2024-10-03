return {
    { "hrsh7th/nvim-cmp",                 event = { "InsertEnter", "CmdlineEnter" },                          dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" } },
    { 'echasnovski/mini.nvim',            version = false },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { 'stevearc/conform.nvim' },
    { 'mg979/vim-visual-multi' },
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui",             dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    { 'mfussenegger/nvim-dap-python' },
    {
        "rolv-apneseth/tfm.nvim",
        config = function()
            vim.keymap.set({ 'n' }, '<Leader>j', '', {
                noremap = true,
                callback = require("tfm").open,
            })
        end,
    },
    { "julianolf/nvim-dap-lldb" }
}
