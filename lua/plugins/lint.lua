require("lint").linters_by_ft = {
    groovy = {
        "npm-groovy-lint",
    },
    c = {
        "clangtidy"
    },
    go = {
        "golangcilint"
    },
    Dockerfile = {
        "hadolint"
    },
    markdown = {
        "markdownlint"
    }
}
