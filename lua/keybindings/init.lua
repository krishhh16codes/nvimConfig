vim.g.mapleader= ' '
local temp = vim.g.mapleader





-- Enable yanking and pasting to system clipboard

vim.cmd('set clipboard=unnamedplus')

-- Create key mappings
vim.api.nvim_set_keymap('n', temp..'y', '"*y', { noremap = true })
vim.api.nvim_set_keymap('n', temp..'p', '"*p', { noremap = true })
vim.api.nvim_set_keymap('n', temp..'Y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', temp..'P', '"+p', { noremap = true })


-- Other key Bindings

local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
