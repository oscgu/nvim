require("formatter").setup({
    filetype = {
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
        ["go"] = {
            require("formatter.filetypes.go").gofmt,
        },
        ["c"] = {
            require("formatter.filetypes.c").clangformat,
        },
        ["cpp"] = {
            require("formatter.filetypes.c").clangformat,
        },
        ["graphql"] = {
            require("formatter.filetypes.graphql").prettier,
        },
        ["html"] = {
            require("formatter.filetypes.html").prettier,
        },
        ["json"] = {
            require("formatter.filetypes.json").jq,
        },
        ["lua"] = {
            require("formatter.filetypes.lua").stylua,
        },
        ["markdown"] = {
            require("formatter.filetypes.markdown").prettier,
        },
        ["sql"] = {
            require("formatter.filetypes.sql").pgformat,
        },
        ["typescript"] = {
            require("formatter.filetypes.typescript").prettier,
        },
        ["xml"] = {
            require("formatter.filetypes.xml").tidy,
        },
        ["yaml"] = {
            require("formatter.filetypes.yaml").yamlfmt,
        },
        ["python"] = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").isort,
        }
    },
})
