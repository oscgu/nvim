vim.cmd([[ command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%")) ]])
vim.cmd([[ command! NeotestSummary lua require("neotest").summary.toggle() ]])
vim.cmd([[ command! Neotest lua require("neotest").run.run(vim.fn.getcwd()) ]])

-- Lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- Neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

--- Ansible Lint
local function is_ansible_project()
    local current_path = vim.fn.expand('%:p:h')
    while current_path ~= '/' do
        if vim.fn.isdirectory(current_path .. '/inventories') == 1 then
            return true
        end
        current_path = vim.fn.fnamemodify(current_path, ':h')
    end
    return false
end

local function set_ansible_filetype()
    if is_ansible_project() then
        vim.cmd('set filetype=yaml.ansible')
    end
end

_G.set_ansible_filetype = set_ansible_filetype

vim.cmd([[
augroup ansible_project
autocmd!
autocmd BufRead,BufNewFile *.yml lua set_ansible_filetype()
augroup END
]])
