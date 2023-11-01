require("plugins")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- empty setup using defaults
require("nvim-tree").setup()


-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- Set general Vim settings
vim.cmd([[
  set number relativenumber autoindent
  set tabstop=2 shiftwidth=2 softtabstop=2 mouse=a
]])


require('mason-config')
require('mason-lspconfig')
require('keybindings')
require('whichkey-config')
require('treesitter-config')
require('lualine-config')
require('bufferline-config')
require('nvim-cmp')
require('tokyonight-config')
require('liveServer')
require("ibl").setup()
vim.cmd[[colorscheme tokyonight-night]]
vim.g.python_recommended_style = 0

vim.cmd([[
  augroup python
    " ftype/python.vim overwrites this
    autocmd!
    autocmd FileType python setlocal ts=2 sts=2 sw=2 noexpandtab
  augroup END
]])

vim.cmd("autocmd FileType python setlocal tabstop=2")
