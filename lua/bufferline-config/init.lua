require("bufferline").setup{}
vim.cmd[[
nnoremap <silent><S-q> :bd!<CR>
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
