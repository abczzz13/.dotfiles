local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "python", "lua", "rust", "bash", "gitignore", "gitattributes", "go", "html", "json", "sql", "toml", "vim", "yaml", "help" },
    sync_install = false,
    auto_install = true,
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = { "yaml", } -- "python" }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

require("telescope").load_extension("git_worktree")
