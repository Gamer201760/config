vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



local opts = { noremap = true, silent = true }


vim.keymap.set({ 'n' }, '<Leader>w', '<cmd>w<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>q', '<cmd>q<cr>', opts)

vim.keymap.set({ 'n' }, '<Leader>j', '<cmd>Neotree float<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>'", '<cmd>TSJToggle<cr>', opts)
vim.keymap.set({ 'n', 'v' }, "<Leader>/", '<cmd>normal gcc<cr>', opts)

vim.keymap.set({ 'n' }, "<Leader>f", '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>F", '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>d", '<cmd>Telescope diagnostics<cr>', opts)

vim.keymap.set('i', 'jj', '<esc>', opts)
