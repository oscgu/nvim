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

vim.cmd([[ command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%")) ]])
vim.cmd([[ command! NeotestSummary lua require("neotest").summary.toggle() ]])
vim.cmd([[ command! Neotest lua require("neotest").run.run(vim.fn.getcwd()) ]])
