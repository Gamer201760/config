vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



local opts = { noremap = true, silent = true }

-- vim.keymap.set('i', 'jj', '<esc>', opts)

-- save & exit
vim.keymap.set({ 'n' }, '<Leader>w', '<cmd>w<cr>', opts)
vim.keymap.set({ 'n' }, '<Leader>q', '<cmd>q<cr>', opts)

-- features
-- vim.keymap.set({ 'n' }, '<Leader>j', '<cmd>Tfm<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>'", '<cmd>TSJToggle<cr>', opts)

-- comment string
vim.keymap.set({ 'n', 'v' }, "<Leader>/", '<cmd>normal gcc<cr>', opts)

-- Telescope fast nav in project
vim.keymap.set({ 'n' }, "<Leader>f", '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>F", '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>d", '<cmd>Telescope diagnostics<cr>', opts)

-- Buffer nav
vim.keymap.set({ 'n', 'i', 'v' }, "<M-Tab>", '<cmd>bnext<cr>', opts)
vim.keymap.set({ 'n', 'i', 'v' }, "<M-p>", '<cmd>bprevious<cr>', opts)
vim.keymap.set({ 'n', 'i', 'v' }, "<M-q>", '<cmd>bd<cr>', opts)

-- C++ complile
vim.keymap.set({ 'n' }, "<Leader>cp",
    '<cmd>!g++ -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -std=gnu++20 -Wall % && ./a.out<cr>', opts)
vim.keymap.set({ 'n' }, "<Leader>cd", '<cmd>!g++ -D_GLIBCXX_DEBUG -std=gnu++20 -g -Wall %<cr>', opts)

-- C++ Template
vim.keymap.set({ 'n' }, "<Leader>-=",
    ":lua Insert_template_from_file('/Users/gglamer/.config/nvim/templates/algs.cpp')<CR>", opts)
