local opt = vim.opt

opt.list = true
opt.listchars:append("eol:↴")

opt.colorcolumn = "80"
opt.number = true
opt.signcolumn = "yes"

opt.encoding = "utf8"
opt.fileencoding = "utf8"
opt.syntax = "ON"
opt.termguicolors = true

opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.splitright = true
opt.splitbelow = true

vim.diagnostic.config({
    update_in_insert = true,
})

local g = vim.g

g.t_co = 256
g.background = "dark"
g.mapleader = ","
g.material_style = "darker"
g.hidden = true
g.localleader = ","

vim.filetype.add({
    pattern = {
        [".*/.github/workflows/.*%.ya?ml"] = "yaml.ghworkflow",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    },
    extension = {
        templ = "templ",
    },
})
