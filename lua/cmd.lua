vim.cmd 'colorscheme material'

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <plug.lua> | PackerCompile
augroup end
]])

vim.cmd([[
augroup accurate_syn_hl
autocmd!
autocmd BufEnter * :syntax sync fromstart
augroup END
]])

vim.cmd([[ au BufNewFile,BufRead /*.v setf v ]])
